# frozen_string_literal: true

class ChefsController < ApplicationController
  def index
    @chefs = Chef.all
    render json: @chefs
  end

  def show
    @chef = Chef.find(params[:id])
    render json: {
      chef: @chef,
      name: @chef.user.name,
      cpf: @chef.user.cpf,
      email: @chef.user.email,
    }
  end

  def show_address
    chef = Chef.find(params[:chef_id])
    render json: { address: chef.address }
  end

  def show_city
    chef = Chef.find(params[:chef_id])
    render json: { city: chef.city }
  end

  def show_state
    chef = Chef.find(params[:chef_id])
    render json: { state: chef.state }
  end

  def show_telephones
    chef = Chef.find(params[:chef_id])
    render json: { telephones: chef.telephones }
  end

  def show_dishes
    chef = Chef.find(params[:chef_id])
    render json: { dishes: chef.dishes }
  end

  # def update
  #   @chef = Chef.find(params[:id])
  #   @chef.user.update(user_params)
  #   render json: @chef
  # end
end
