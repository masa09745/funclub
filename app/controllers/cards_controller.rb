class CardsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @cards = Card.includes(:user).all
  end

  def new
  end

  def create
  end

end
