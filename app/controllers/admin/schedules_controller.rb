class Admin::SchedulesController < ApplicationController
  before_action  :find_schedule, only: [:edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to admin_schedules_path
    end
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
    def schedule_params
      params.require(:schedule).permit(:start_time, :opponent)
    end

    def find_schedule
      @schedule = Schedule.find(params[:id])
    end


end
