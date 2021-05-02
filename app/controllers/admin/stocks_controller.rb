class Admin::StocksController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end

  def edit
    @schedule = Schedule.find(params[:schedule_id])
    @stocks = @schedule.stocks
  end

  def update
  end

  def import
    Stock.import(params[:file])
    redirect_to admin_stocks_path
  end



end
