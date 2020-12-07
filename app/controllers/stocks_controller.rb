class StocksController < ApplicationController

  def index
    @stocks = Stock.includes(schedule: :team)
  end


end
