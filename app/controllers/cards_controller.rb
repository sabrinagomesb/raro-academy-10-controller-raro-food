# frozen_string_literal: true

class CardsController < ApplicationController
  include ControllersHelper

  before_action :set_customer
  before_action :set_card, only: %i[show update destroy]
  before_action :card_belongs_to_customer?, only: %i[show update destroy]

  def index
    render json: @customer.cards, status: :ok
  end

  def show
    render json: @card, status: :ok
  end

  def create
    card = Card.new(card_params)
    card.customer_id = @customer.id

    if card.save
      render json: { message: 'Card successfully created', card: }, status: :created
    else
      render json: { error: 'Error: address not created', errors: card.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @card.update(card_params)
      render json: { message: 'Card successfully updated', card: @card }, status: :ok
    else
      render json: { error: 'Error: card not updated', errors: @card.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Successfully deleted' } if @card.destroy
  end

  private

  def set_customer
    return unless params[:customer_id]

    @customer = Customer.find(params[:customer_id])
  end

  def set_card
    if params[:id]
      @card ||= Card.find(params[:id])
    else
      render json: { error: 'Error: card not found' }, status: :not_found
    end
  end

  def card_belongs_to_customer?
    return unless @customer && @card.customer_id != @customer.id

    render json: { error: 'Error: card not belong to this customer', errors: full_errors(@customer, @card) },
           status: :unprocessable_entity
  end

  def card_params
    params.require(:card).permit(:number, :expiration_date, :name, :security_code, :card_type)
  end
end
