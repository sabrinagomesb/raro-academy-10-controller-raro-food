# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    @customer = Customer.find(params[:id])
    render json: {
      customer_id: @customer.id,
      name: @customer.user.name,
      cpf: @customer.user.cpf,
      email: @customer.user.email,
    }
  end

  def show_addresses
    customer = Customer.find(params[:customer_id])
    render json: customer.addresses
  end

  def show_telephones
    customer = Customer.find(params[:customer_id])
    render json: customer.telephones
  end

  def show_cards
    customer = Customer.find(params[:customer_id])
    render json: customer.cards
  end
end
