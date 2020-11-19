class SchedulesController < ApplicationController
  def index
  end

  def new
    @schedule = Schedule.new
    @team = Team.all
  end

  def create
    Schedule.create(schedule_params)
      redirect_to root_path
  end

  def show
  end

  private

  def schedule_params
    params.require(:schedule).permit(:match_date, :opponent_id)
  end
end
