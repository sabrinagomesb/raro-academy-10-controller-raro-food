class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show ]

  def index
    @orders = Order.all
    # @orders = @customer.orders
    # @customer = Customer.find(params[:customer_id])
    render json: @orders
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ad
    @ad = Order.find(params[:id])
  end
end
