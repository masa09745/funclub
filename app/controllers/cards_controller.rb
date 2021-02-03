class CardsController < ApplicationController
  require "payjp"

  def index
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_access_key)
    customer = Payjp::Customer.retrieve(@card.customer)
    @card_info = customer.cards.retrieve(@card.card)
  end

  def new
  end

  def create
  end

end
