# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order, only: %i[index show]

  def index
    render json: @order.items, status: :ok
  end

  def show
    render json: @order.items.find(params[:id])
  end

  private

  def set_order
    return unless params[:order_id]

    @order = Order.find(params[:order_id])
  end
end
