class StocksController < ApplicationController

  def index
    @stocks = Stock.includes(schedule: :team)
  end

  def edit
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    redirect_to stocks_path
  end


end
