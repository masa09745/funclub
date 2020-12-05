class SchedulesController < ApplicationController
  def index
    from = Time.current.at_beginning_of_month
    to = (from + 1.month)
    @schedules = Schedule.includes(:team).where(match_date: from...to).order(match_date: :ASC)
  end

  def new
    @schedule = Form::ScheduleCollection.new
    @team = Team.all
  end

  def create
    @schedule = Form::ScheduleCollection.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    end
  end

  def show
  end

  private

  def schedule_params
    params.require(:form_schedule_collection).permit(schedules_attributes: [:match_date, :opponent_id])
  end

end