# frozen_string_literal: true

class TelephonesController < ApplicationController
  before_action :set_telephone, only: %i[show]
  before_action :set_user, only: %i[index]

  def index
    telephones = @user ? @user.telephones : Telephones.all
    render json: telephones, status: :ok
  end

  def show
    render json: @telephones, status: :ok
  end

  private

  def set_telephone
    @telephones = Telephone.find(params[:id])
  end

  def set_user
    return unless params[:chef_id] || params[:customer_id]

    @user = params[:chef_id] ? Chef.find(params[:chef_id]) : Customer.find(params[:customer_id])
  end
end
