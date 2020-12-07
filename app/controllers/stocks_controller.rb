class StocksController < ApplicationController

  def index
    @stocks = Stock.includes(schedule: :team)
  end

  def edit
  end

  def destroy
  end


end
