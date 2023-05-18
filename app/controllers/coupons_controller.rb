# frozen_string_literal: true

class CouponsController < ApplicationController
  before_action :set_coupon, only: %i[show update destroy]

  def index
    render json: Coupon.all, status: :ok
  end

  def show
    render json: @coupon, status: :ok
  end

  def create
    coupon = Coupon.new(coupon_params)

    if coupon.save
      render json: { message: 'Coupon successfully created', coupon: }, status: :created
    else
      render json: { error: 'Error: coupon not created', errors: coupon.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @coupon.update(coupon_params)
      render json: { message: 'Coupon successfully updated', coupon: @coupon }, status: :ok
    else
      render json: { error: 'Error: coupon not updated', errors: @coupon.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @coupon.destroy
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def coupon_params
    params.require(:coupon).permit(:code, :name, :description, :start_date, :end_date, :total_discount, :creator_id)
  end
end
