# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :set_dish, only: %i[show]
  before_action :set_chef, only: %i[index show]

  def index
    dishes = @chef ? @chef.dishes : Dish.all
    render json: dishes
  end

  def show
    dish = @chef ? @chef.dishes.find(params[:id]) : @dish
    render json: dish
  end

  def categories
    render json: Dish.find(params[:dish_id]).categories
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def set_chef
    return unless params[:chef_id]

    @chef = Chef.find(params[:chef_id])
  end
end
