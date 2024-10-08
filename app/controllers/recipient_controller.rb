# frozen_string_literal: true

class RecipientController < ApplicationController
  before_action :authenticate_user!

  # GET    /user/:user_id/order/:order_id/recipient/:id
  def show
    recipient = current_user.orders.find(order_id).addresses.find(id)

    render status: :ok, json: recipient
  end

  def index
    recipient_list = current_user.orders.find(order_id).addresses

    render status: :ok, json: recipient_list

  end

  # POST   /user/:user_id/order/:order_id/recipient
  def create
    data = AddressInformation.create(permitted_params.merge(addressable_type: 'Order', addressable_id: order_id))
    
    render status: :ok, json: { message: 'Morada adicionada à encomenda com sucesso', data: }
  end

  # PUT    /user/:user_id/order/:order_id/recipient/:id
  def update
    recipient = current_user.orders.find(order_id).addresses.find(id)
    recipient.update!(permitted_params)

    render status: :ok, json: { message: 'Morada da encomenda alterada com sucesso' }
  rescue StandardError => e
    render status: :unprocessable_entity, json: { message: e.message }
  end

  # DELETE /user/:user_id/order/:order_id/recipient/:id
  def destroy
    current_user.orders.find(order_id).addresses.find(id).destroy

    render status: :ok, json: { message: 'Morada da encomenda apagada com sucesso' }
  end

  private

  def permitted_params
    params.permit(valid_collumns)
  end

  def valid_collumns
    %i[id name address1 address2 postal_code1 postal_code2 city phone_number]
  end

  def order_id
    params.require(:order_id)
  end
end
