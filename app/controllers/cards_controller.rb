class CardsController < ApplicationController
  before_action :find_card
  require "payjp"

  def show
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_access_key)
      customer = Payjp::Customer.retrieve(@card.customer)
      @card_data = customer.cards.retrieve(@card.card)
      @default_card = customer.default_card
    else
      redirect_to action: 'new'
    end
  end

  def new
    @card  = Card.new
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_access_key)
    @customer = Payjp::Customer.create(
      description: 'FunClub',
      email: current_user.email,
      card: params[:payjp_token]
    )

    @card = Card.new(user_id: current_user.id, customer: @customer.id, card: params[:card_token])

    if @card.save!
      redirect_to action: 'index'
    end
  end

  def edit

  end

  def update

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_access_key)
    customer = Payjp::Customer.retrieve(@card.customer)
    card = customer.cards.retrieve(@card.card)
    card.delete

    customer.cards.create(
      card: params[:payjp_token]
    )

    @card.update(card: params[:card_token])

    redirect_to action: 'index'
  end

  private
    def find_card
      @card =Card.find_by(user_id: current_user.id)
    end

end
