# frozen_string_literal: true

class CustomersController < ApplicationController
  include ControllersHelper

  before_action :set_customer, only: %i[show update destroy]
  before_action :set_user, only: %i[update destroy]

  def index
    @customers = Customer.all
    render json: @customers, status: :ok
  end

  def show
    render json: customer_json(@customer), status: :ok
  end

  def cards
    render json: @customer.cards, status: :ok
  end

  def create
    user = User.new(user_params)
    customer = Customer.new(customer_params)
    customer.user = user

    if user.save && customer.save
      render json: { message: 'Customer successfully created', customer: customer_json(customer) }, status: :created
    else
      render json: { error: 'Error: customer not created', errors: full_errors(user, customer) },
             status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params) && @customer.update(customer_params)
      render json: { message: 'Customer successfully updated', customer: customer_json(@customer) }, status: :ok
    else
      render json: { error: 'Error: customer not updated', errors: full_errors(@user, @customer) },
             status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @customer.destroy && @user.destroy
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id] || params[:id])
  end

  def set_user
    @user = @customer.user
  end

  def customer_json(customer)
    {
      customer_id: customer.id,
      name: customer.user.name,
      cpf: customer.user.cpf,
      email: customer.user.email,
      birthday: customer.birthday,
      created_at: customer.created_at,
      updated_at: customer.updated_at
    }
  end

  def customer_params
    params.require(:customer).permit(:birthday)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :cpf)
  end
end
