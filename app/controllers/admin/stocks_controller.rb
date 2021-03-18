class Admin::StocksController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end

  def new
  end
  



end
