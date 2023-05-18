# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show city update destroy]
  before_action :set_customer, only: %i[index show create update destroy]
  before_action :set_coupon, only: %i[index]
  before_action :order_belongs_to_customer?, only: %i[update destroy]

  def index
    orders = if @customer
               @customer.orders
             elsif @coupon
               @coupon.orders
             else
               Order.all
             end

    render json: orders, status: :ok
  end

  def show
    order = @customer ? @customer.orders.find(params[:id]) : @order
    render json: order, status: :ok
  end

  def create
    order = Order.new(order_params)
    order.customer_id = @customer.id if @customer

    if order.save
      render json: { message: 'Order successfully created', order: }, status: :created
    else
      render json: { error: 'Error: order not created', errors: order.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: { message: 'Order successfully updated', order: @order }, status: :ok
    else
      render json: { error: 'Error: order not updated', errors: @order.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @order.destroy
  end

  def city
    render json: @order.city, status: :ok
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

  def order_params
    params.require(:order).permit(:total_price, :freight_price, :status, :customer_id, :coupon_id, :delivery_address_id)
  end

  def order_belongs_to_customer?
    return unless @customer && @order.customer_id != @customer.id

    render json: { error: 'Error: order not deleted', errors: 'Order not belongs to this customer' },
           status: :not_found
  end
end
