# frozen_string_literal: true

class CouponsController < ApplicationController
  before_action :set_coupon, only: %i[show]

  def index
    render json: Coupon.all, status: :ok
  end

  def show
    render json: @coupon, status: :ok
  end

  def show_orders
    coupon = Coupon.find(params[:coupon_id])
    render json: coupon.orders, status: :ok
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end
end
