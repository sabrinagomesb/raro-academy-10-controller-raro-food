# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show update destroy customer]
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

  def create
    payment = Payment.new(payment_params)

    if payment.save
      render json: { message: 'Payment successfully created', payment: }, status: :created
    else
      render json: { error: 'Error: Payment not created', errors: payment.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      render json: @payment, status: :ok
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @payment.destroy
  end

  private

  def set_payment
    return unless params[:payment_id] || params[:id]

    @payment = Payment.find(params[:payment_id] || params[:id])
  end

  def set_order
    return unless params[:order_id]

    @order = Order.find(params[:order_id])
  end

  def payment_params
    params.require(:payment).permit(:state, :payment_type, :order_id, :card_id)
  end
end
