# frozen_string_literal: true

class UserAddressController < ApplicationController
  before_action :authenticate_user!

  # GET    /user/:user_id/address/:id
  def show
    user_address = current_user.addresses.select(valid_collumns).find(params.require(:id))

    render status: :ok, json: user_address
  end

  # GET    /user/:user_id/address
  def index
    address_list = current_user.addresses.select(valid_collumns)

    render status: :ok, json: address_list
  end

  # POST   /user/:user_id/address
  def create
    new_address = AddressInformation.create!(permitted_params)
    current_user.addresses << new_address

    render status: :ok, json: { message: 'Endereço guardado com sucesso' }
  rescue StandardError
    render status: :unprocessable_entity, json: { message: 'Erro a guardar endereço' }
  end

  # PUT    /user/:user_id/address/:id
  def update
    updatable_address = current_user.addresses.find(params.require(:id))
    updatable_address.update!(permitted_params)

    render status: :ok, json: { message: 'Endereço alterado com sucesso' }
  rescue StandardError
    render status: :unprocessable_entity, json: { message: 'Erro a alterar endereço' }
  end

  # DELETE /user/:user_id/address/:id
  def destroy
    current_user.addresses.find(params.require(:id))
    AddressInformation.destroy(params.require(:id))

    render status: :ok, json: { message: 'Endereço apagado com sucesso' }
  rescue StandardError
    render status: :unprocessable_entity, json: { message: 'Erro a apagar endereço' }
  end

  private

  def permitted_params
    params.permit(valid_collumns).merge(addressable_type: 'User', addressable_id: current_user.id)
  end

  def valid_collumns
    %i[id name address1 address2 postal_code1 postal_code2 city phone_number]
  end

end
