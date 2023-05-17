# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show customer]
  before_action :set_order, only: %i[index]

  def index
    @payments = @order ? @order.payment : Payment.all
    render json: @payments
  end

  def show
    render json: @payment
  end

  def customer
    render json: @payment.customer
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
