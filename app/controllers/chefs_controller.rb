# frozen_string_literal: true

class ChefsController < ApplicationController
  include ControllerHelper

  before_action :set_chef, only: %i[show city update destroy]

  def index
    @chefs = Chef.all
    render json: @chefs.map { |chef| chef_json(chef) }, status: :ok
  end

  def show
    render json: chef_json(@chef), status: :ok
  end

  def create
    user = User.new(chef_params)
    address = Address.new(address_params)
    chef = Chef.new(user:, address:)

    address.addressable = chef
    chef.approver_id = Administrator.all.sample.id # Temporary

    if user.save && address.save && chef.save
      render json: { message: 'Chef successfully created', chef: chef_json(chef) }, status: :created
    else
      render json: { error: 'Error: chef not created', errors: full_errors(user, address, chef) },
             status: :unprocessable_entity
    end
  end

  def update
    user = @chef.user
    address = @chef.address

    if user.update(chef_params) && address.update(address_params)
      render json: { message: 'Chef successfully updated', chef: chef_json(@chef) }, status: :ok
    else
      render json: { error: 'Error: chef not updated', errors: full_errors(user, address, @chef) },
             status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @chef.destroy && @chef.user.destroy
  end

  def city
    render json: @chef.city, status: :ok
  end

  private

  def set_chef
    @chef = Chef.find(params[:chef_id] || params[:id])
  end

  def chef_json(chef)
    {
      chef_id: chef.id,
      name: chef.user.name,
      cpf: chef.user.cpf,
      email: chef.user.email,
      created_at: chef.created_at,
      updated_at: chef.updated_at,
      city: chef.city.name,
      state: chef.city.state.acronym
    }
  end

  def chef_params
    params.require(:chef).permit(:name, :email, :password, :cpf)
  end

  def address_params
    params.require(:address).permit(:name, :public_place, :zip_code, :number,
                                    :reference, :complement, :neighborhood,
                                    :city_id, :addressable_id, :addressable_type)
  end
end
