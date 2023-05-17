# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show]

  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    render json: {
      customer_id: @customer.id,
      name: @customer.user.name,
      cpf: @customer.user.cpf,
      email: @customer.user.email,
      birthday: @customer.birthday,
      created_at: @customer.created_at,
      updated_at: @customer.updated_at
    }
  end

  def cards
    render json: @customer.cards
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id] || params[:id])
  end
end
