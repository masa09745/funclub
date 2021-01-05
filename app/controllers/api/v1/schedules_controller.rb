class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all
    render json: schedules
  end

  def show
    schedule = Schedule.find(params[:id])
    render json: schedule
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
  end

end