# frozen_string_literal: true

class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
    render json: @coupons
  end

  def show
    @coupon = Coupon.find(params[:id])
    render json: @coupon
  end

  def show_orders
    coupon = Coupon.find(params[:coupon_id])
    render json: coupon.orders
  end
end
