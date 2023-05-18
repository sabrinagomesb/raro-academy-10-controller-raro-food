# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show destroy update]
  before_action :set_user, only: %i[index create update]

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
    render json: @address
  end

  def create
    address = Address.new(address_params)

    if @user.instance_of?(Chef)
      render json: { error: 'Error: chef not allowed to create address', errors: address.errors },
             status: :unprocessable_entity
    end

    if @user
      address.addressable_id = @user.id
      address.addressable_type = @user.class.name
    end

    if address.save
      render json: { message: 'Address successfully created', address: }, status: :created
    else
      render json: { error: 'Error: address not created', errors: address.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user && @address.addressable_id != @user.id
      render json: { error: 'Error: address not updated', errors: @address.errors }, status: :unprocessable_entity
      return
    end

    if @address.update(address_params)
      render json: { message: 'address successfully updated', address: @address }, status: :ok
    else
      render json: { error: 'Error: address not updated', errors: @address.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @address.destroy
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def set_user
    if params[:chef_id]
      @user = Chef.find(params[:chef_id])
    elsif params[:customer_id]
      @user = Customer.find(params[:customer_id])
    end
  end

  def address_params
    params.require(:address).permit(:name, :public_place, :zip_code, :number,
                                    :reference, :complement, :neighborhood,
                                    :city_id, :addressable_id, :addressable_type)
  end
end
