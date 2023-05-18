# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show update destroy]
  before_action :set_user, only: %i[ update destroy]

  def index
    @customers = Customer.all
    render json: @customers, status: :ok
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
    }, status: :ok
  end

  def cards
    render json: @customer.cards, status: :ok
  end

  def create
    user = User.new({
                      name: customer_params[:name],
                      email: customer_params[:email],
                      password: customer_params[:password],
                      cpf: customer_params[:cpf]
                    })

    customer = Customer.new({
                              birthday: customer_params[:birthday],
                              user:
                            })

    if user.save && customer.save
      render json: { message: 'Customer successfully created', customer: }, status: :created
    else
      render json: { error: 'Error: customer not created', errors: user.errors }, status: :unprocessable_entity
    end
  end

  def update
    user_params_input = {
      name: customer_params[:name],
      email: customer_params[:email],
      password: customer_params[:password],
      cpf: customer_params[:cpf]
    }

    customer_params_input = {
      birthday: customer_params[:birthday]
    }

    if @user.update(user_params_input) && @customer.update(customer_params_input)
      render json: { message: 'Customer successfully updated', customer: {
        customer_id: @customer.id,
        name: @customer.user.name,
        cpf: @customer.user.cpf,
        email: @customer.user.email,
        birthday: @customer.birthday,
      } }, status: :ok
    else
      render json: { error: 'Error: customer not updated', errors: @user.errors }, status: :unprocessable_entity
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

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :birthday, :cpf)
  end
end
