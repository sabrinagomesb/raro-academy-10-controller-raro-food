# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show]
  before_action :set_user, only: %i[index]

  def index
    addresses = if @user.instance_of?(Chef)
                  @user.address
                elsif @user.instance_of?(Customer)
                  @user.addresses
                else
                  Address.all
                end

    render json: addresses, status: :ok
  end

  def show
    render json: @addresses
  end

  private

  def set_address
    @addresses = Address.find(params[:id])
  end

  def set_user
    if params[:chef_id]
      @user = Chef.find(params[:chef_id])
    elsif params[:customer_id]
      @user = Customer.find(params[:customer_id])
    end
  end
end
