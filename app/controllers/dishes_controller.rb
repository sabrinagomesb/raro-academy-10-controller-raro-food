# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :set_dish, only: %i[show update destroy]
  before_action :set_chef, only: %i[index show create update destroy]
  before_action :set_order, only: %i[index show]
  before_action :dish_belongs_to_chef?, only: %i[update destroy]

  def index
    dishes = if @order
               @order.dishes
             elsif @chef
               @chef.dishes
             else
               Dish.all
             end

    render json: dishes, status: :ok
  end

  def show
    dish = @chef ? @chef.dishes.find(params[:id]) : @dish
    render json: dish, status: :ok
  end

  def categories
    render json: Dish.find(params[:dish_id]).categories
  end

  def create
    dish = Dish.new(dish_params)
    dish.chef_id = @chef.id if @chef

    if dish.save
      render json: { message: 'Dish successfully created', dish: }, status: :created
    else
      render json: { error: 'Error: dish not created', errors: dish.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @dish.update(dish_params)
      render json: { message: 'Dish successfully updated', dish: @dish }, status: :ok
    else
      render json: { error: 'Error: dish not updated', errors: @dish.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @dish.destroy
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

  def dish_params
    params.require(:dish).permit(:name, :description, :available, :active, :unit_price, :chef_id)
  end

  def dish_belongs_to_chef?
    return unless @chef && @dish.chef_id != @chef.id

    render json: { error: 'Error: dish not deleted', errors: 'Dish not belongs to this chef' },
           status: :not_found
  end
end
