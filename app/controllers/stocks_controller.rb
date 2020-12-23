class StocksController < ApplicationController

  def index
    @stocks = Stock.includes(:schedule)
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update(stock_params)
    redirect_to stocks_path
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    redirect_to stocks_path
  end

  private

  def stock_params
    params.require(:stock).permit(:grade, :price, :remain)
  end

end
