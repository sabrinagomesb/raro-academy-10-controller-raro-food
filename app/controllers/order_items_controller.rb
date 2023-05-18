# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order, only: %i[index show create update]
  before_action :set_order_item, only: %i[show update]

  def index
    render json: @order.items, status: :ok
  end

  def show
    render json: @order_item
  end

  def create
    order_item = OrderItem.new(order_item_params)
    order_item.order_id = @order.id

    if order_item.save
      render json: { message: 'Order item successfully created', order_item: }, status: :created
    else
      render json: { error: 'Error: order item not created', errors: order_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @order_item.update(order_item_params)
      render json: { message: 'Order item successfully updated', order_item: @order_item }, status: :ok
    else
      render json: { error: 'Error: order item not updated', errors: @order_item.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    order_item = OrderItem.find(params[:id])

    render json: { message: 'Successfully deleted' } if order_item.destroy
  end

  private

  def set_order
    return unless params[:order_id]

    @order = Order.find(params[:order_id])
  end

  def set_order_item
    @order_item = @order.items.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:dish_id, :amount, :unit_price)
  end
end
