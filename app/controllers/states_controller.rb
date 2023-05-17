# frozen_string_literal: true

class StatesController < ApplicationController
  before_action :set_state, only: %i[show]
  before_action :set_chef, only: %i[index]

  def index
    states = @chef ? @chef.state : State.all
    render json: states, status: :ok
  end

  def show
    render json: @state, status: :ok
  end

  def cities
    render json: State.find(params[:state_id]).cities
  end

  private

  def set_state
    @state = State.find(params[:id])
  end

  def set_chef
    return unless params[:chef_id]

    @chef = Chef.find(params[:chef_id])
  end
end
