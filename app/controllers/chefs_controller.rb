# frozen_string_literal: true

class ChefsController < ApplicationController
  def index
    @chefs = Chef.all
    render json: @chefs
  end

  def show
    @chef = Chef.find(params[:id])
    render json: {
      chef_id: @chef.id,
      name: @chef.user.name,
      cpf: @chef.user.cpf,
      email: @chef.user.email,
    }
  end

  def show_address
    chef = Chef.find(params[:chef_id])
    render json: chef.address
  end

  def show_city
    chef = Chef.find(params[:chef_id])
    render json: chef.city
  end

  def show_state
    chef = Chef.find(params[:chef_id])
    render json: chef.state
  end

  def show_telephones
    chef = Chef.find(params[:chef_id])
    render json: chef.telephones
  end

  def show_dishes
    chef = Chef.find(params[:chef_id])
    render json: chef.dishes
  end

  # /users method: post
  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     render json: @user, status: :created
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end

  #   @chef = Chef.new(
  #     user: @user,
  #     approver: Administrator.first,
  #     address: Address.first,
  #   )

  #   if @chef.save
  #     render json: @chef, status: :created
  #   else
  #     render json: @chef.errors, status: :unprocessable_entity
  #   end
  # end

  # private

  # def chef_params
  #   params.require(:chef).permit(:name, :email, :password, :cpf)
  # end

  # def update
  #   @chef = Chef.find(params[:id])
  #   @chef.user.update(user_params)
  #   render json: @chef
  # end
end
