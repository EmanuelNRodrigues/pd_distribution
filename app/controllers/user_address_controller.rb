# frozen_string_literal: true

class UserAddressController < ApplicationController
  before_action :authenticate_user!

  def index
    address_list = UserSerializer.addresses(current_user.addresses)

    render status: :ok, json: address_list
  end

  def create
    new_address = AddressInformation.create!(params_permit)
    current_user.addresses << new_address

    render status: :ok, json: { message: 'Endereço guardado com sucesso' }
  rescue StandardError
    render status: :unprocessable_entity, json: { message: 'Erro a guardar endereço' }
  end

  def update
    updatable_address = current_user.addresses.find(params.require(:id))
    updatable_address.update!(params_permit)

    render status: :ok, json: { message: 'Endereço alterado com sucesso' }
  rescue StandardError
    render status: :unprocessable_entity, json: { message: 'Erro a alterar endereço' }
  end

  def destroy
    current_user.addresses.find(params.require(:id))
    AddressInformation.destroy(params.require(:id))

    render status: :ok, json: { message: 'Endereço apagado com sucesso' }
  rescue StandardError
    render status: :unprocessable_entity, json: { message: 'Erro a apagar endereço' }
  end

  private

  def params_permit
    params.permit(:address1, :address2, :city, :name, :postal_code1, :postal_code2)
  end
end
