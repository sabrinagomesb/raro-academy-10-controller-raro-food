# frozen_string_literal: true

class TelephonesController < ApplicationController
  include ControllersHelper

  before_action :set_telephone, only: %i[show destroy update]
  before_action :set_user, only: %i[index show create update destroy]
  before_action :telephone_belongs_to_user?, only: %i[show update destroy]

  def index
    telephones = @user ? @user.telephones : Telephones.all
    render json: telephones, status: :ok
  end

  def show
    render json: @telephone, status: :ok
  end

  def create
    telephone = Telephone.new(telephone_params)

    if @user
      telephone.contactable_id = @user.id
      telephone.contactable_type = @user.class.name
    end

    if telephone.save
      render json: { message: 'Telephone successfully created', telephone: }, status: :created
    else
      render json: { error: 'Error: telephone not created', errors: telephone.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @telephone.update(telephone_params)
      render json: { message: 'Telephone successfully updated', telephone: @telephone }, status: :ok
    else
      render json: { error: 'Error: telephone not updated', errors: @telephone.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @telephone.destroy
  end

  private

  def set_telephone
    @telephone = Telephone.find(params[:id])
  end

  def set_user
    return unless params[:chef_id] || params[:customer_id]

    @user = params[:chef_id] ? Chef.find(params[:chef_id]) : Customer.find(params[:customer_id])
  end

  def telephone_belongs_to_user?
    return unless @user && @telephone.contactable_id != @user.id

    render json: { error: 'Error: telephone not belong to this chef', errors: full_errors(@user, @telephone) },
           status: :unprocessable_entity
    nil
  end

  def telephone_params
    params.require(:telephone).permit(:number, :contactable_id, :contactable_type)
  end
end
