class DishesController < ApplicationController
  def index
    @dishes = Dish.all
    render json: @dishes
  end

  def show
    @dish = Dish.find(params[:id])
    render json: @dish
  end

  def show_categories
    @dish = Dish.find(params[:dish_id])
    render json: @dish.categories
  end
end
