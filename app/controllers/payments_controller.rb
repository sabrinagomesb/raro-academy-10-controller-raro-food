# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show customer]
  before_action :set_order, only: %i[index]

  def index
    @payments = @order ? @order.payment : Payment.all
    render json: @payments, status: :ok
  end

  def show
    render json: @payment, status: :ok
  end

  def customer
    render json: {
      customer_id: @payment.customer.id,
      name: @payment.customer.user.name,
      cpf: @payment.customer.user.cpf,
      email: @payment.customer.user.email,
      birthday: @payment.customer.birthday,
      created_at: @payment.customer.created_at,
      updated_at: @payment.customer.updated_at
    }, status: :ok
  end

  private

  def set_payment
    @payment = Payment.find(params[:payment_id] || params[:id])
  end

  def set_order
    return unless params[:order_id]

    @order = Order.find(params[:order_id])
  end
end
