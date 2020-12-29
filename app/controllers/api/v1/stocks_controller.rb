class Api::V1::StocksController < ApplicationController
  def index
    stocks = Stock.includes(:schedule)
    render json: stocks.as_json(include: :schedule)
  end

end