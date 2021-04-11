class Admin::SchedulesController < ApplicationController
  before_action  :find_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = ScheduleForm.new
  end

  def create
    @schedule = ScheduleForm.new(schedule_form_params)
    if @schedule.save
      redirect_to admin_schedules_path
    end
  end

  def show
  end

  def edit
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

    def find_schedule
      @schedule = Schedule.find(params[:id])
    end


end
