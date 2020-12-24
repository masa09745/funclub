class Api::V1::AdminsController < ApplicationController
  def index
    schedules = Schedule.all
    render json: schedules
  end
  
end
