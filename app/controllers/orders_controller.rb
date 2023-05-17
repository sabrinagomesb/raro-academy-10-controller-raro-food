# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show city]
  before_action :set_customer, only: %i[index show]
  before_action :set_coupon, only: %i[index]

  def index
    orders = if @customer
               @customer.orders
             elsif @coupon
               @coupon.orders
             else
               Order.all
             end

    render json: orders
  end

  def show
    order = @customer ? @customer.orders.find(params[:id]) : @order
    render json: order
  end

  def city
    render json: @order.city
  end

  private

  def set_order
    @order = Order.find(params[:order_id] || params[:id])
  end

  def set_customer
    return unless params[:customer_id]

    @customer = Customer.find(params[:customer_id])
  end

  def set_coupon
    return unless params[:coupon_id]

    @coupon = Coupon.find(params[:coupon_id])
  end
end
