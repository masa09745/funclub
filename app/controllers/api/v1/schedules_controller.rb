class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all.order(match_date: :ASC)
    render json: schedules
  end

  def show
    stock = Stock.where(schedule_id: params[:id])
    render json: stock
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    head :no_content
  end

end