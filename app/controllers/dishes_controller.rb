# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :set_dish, only: %i[show]
  before_action :set_chef, only: %i[index show]
  before_action :set_order, only: %i[index show]

  def index
    dishes = if @order
               @order.dishes
             elsif @chef
               @chef.dishes
             else
               Dish.all
             end

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

  def set_order
    return unless params[:order_id]

    @order = Order.find(params[:order_id])
  end
end
