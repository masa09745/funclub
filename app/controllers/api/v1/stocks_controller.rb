class Api::V1::StocksController < ApplicationController
  def index
    stock = Stock.where(schedule_id: params[:id])
    render json: stock
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.save
    head :no_content

  end

  private
    def stock_params
      params.require(:stock).permit(:grade, :price, :remain, :schedule_id)
    end
end
