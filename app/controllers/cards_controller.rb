class CardsController < ApplicationController
  require "payjp"

  def index
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_access_key)
    customer = Payjp::Customer.retrieve(@card.customer)
    @card_info = customer.cards.retrieve(@card.card)
  end

  def new
    @card  = Card.new
  end

  def create
    @cards = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_access_key)
    customer = Payjp::Customer.retrieve(@cards.customer)

    customer.cards.create(
      card: params[:payjp_token]
    )
    @card = Card.new(user_id: current_user.id, customer: customer.id, card: customer.default_card)
    if @card.save!
      redirect_to action: 'index'
    end

  end



end
