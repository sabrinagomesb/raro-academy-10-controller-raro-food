# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :set_chef, only: %i[show city]

  def index
    @chefs = Chef.all
    render json: @chefs, status: :ok
  end

  def show
    render json: {
      chef_id: @chef.id,
      name: @chef.user.name,
      cpf: @chef.user.cpf,
      email: @chef.user.email,
      created_at: @chef.created_at,
      updated_at: @chef.updated_at
    }, status: :ok
  end

  def city
    render json: @chef.city, status: :ok
  end

  private

  def set_chef
    @chef = Chef.find(params[:chef_id] || params[:id])
  end
end
