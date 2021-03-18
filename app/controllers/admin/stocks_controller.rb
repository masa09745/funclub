class Admin::StocksController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end



end
