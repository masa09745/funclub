class Admin::SchedulesController < ApplicationController
  before_action  :load_schedule, only:[ :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule_form = ScheduleForm.new
  end

  def create
    @schedule_form = ScheduleForm.new(schedule_form_params)
    if @schedule_form.save
      redirect_to admin_schedules_path
    end
  end

  def edit
    @schedule = Schedule.includes(:stocks).find(params[:id])
  end

  def update
    @schedule.update(schedule_params)
    redirect_to admin_schedules_path
  end

  def destroy
    @schedule.destroy
    redirect_to admin_schedules_path
  end

  def import
    Schedule.import(params[:file])
    redirect_to admin_schedules_path
  end

  private
    def schedule_form_params
      params.require(:schedule_form).permit(:start_time, :opponent, stocks_attributes: [:grade, :price, :remain])
    end

    def schedule_params
      params.require(:schedule).permit(:start_time, :opponent)
    end

    def load_schedule
      @schedule = Schedule.find(params[:id])
    end
end
