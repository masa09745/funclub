class Admin::StocksController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end

  def show
    @schedules = Schedule.find(params[:schedule_id])
  end

  def new
  end
  



end
