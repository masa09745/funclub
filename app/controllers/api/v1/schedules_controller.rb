class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all.order(match_date: :ASC)
    render json: schedules
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    head :no_content
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    head :no_content
  end

  private
  def schedule_params
    params.require(:schedule).permit(:match_date, :match_time, :opponent)
  end

end