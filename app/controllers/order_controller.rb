# frozen_string_literal: true

class OrderController < ApplicationController
  before_action :authenticate_user!

  # GET    /user/:user_id/order/:id
  def show
    order = @user.orders.select(valid_collumns).find(id)

    render status: :ok, json: order
  end

  # GET    /user/:user_id/order
  def index
    user_order_list = @user.orders.select(valid_collumns)

    render status: :ok, json: user_order_list
  end

  # POST   /user/:user_id/order
  def create
    create_order_params = permitted_params.merge(user_id: @user.id)
    new_order = Order.create!(create_order_params)
    data = OrderSerializer.single(new_order)

    render status: :ok, json: { message: 'Ordem criada com sucesso', data: }
  rescue StandardError => e
    render status: :unprocessable_entity, json: { message: e.message }
  end

  # PUT    /user/:user_id/order/:id
  def update
    order = @user.orders.find(id)
    order.update!(permitted_params)

    render status: :ok, json: { message: 'Encomenda alterada com sucesso' }
  rescue StandardError => e
    render status: :unprocessable_entity, json: { message: e.message }
  end

  # DELETE /user/:user_id/order/:id
  def destroy
    @user.orders.find(id).destroy

    render status: :ok, json: { message: 'Ordem apagada com sucesso' }
  rescue StandardError
    render status: :unprocessable_entity, json: { message: 'Erro a apagar orderm' }
  end

  private

  def permitted_params
    params.permit(valid_collumns << :collected_at)
  end

  def valid_collumns
    %i[id weight payement_value services packets_count comments status]
  end
end
