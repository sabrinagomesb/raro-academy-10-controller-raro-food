# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_customer, only: %i[index show]

  def index
    render json: @customer.cards
  end

  def show
    render json: @customer.cards.find(params[:id])
  end

  private

  def set_customer
    return unless params[:customer_id]

    @customer = Customer.find(params[:customer_id])
  end
end
