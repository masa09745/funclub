class Admin::SchedulesController < ApplicationController
  before_action  :load_schedule, only: [:edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule_form = ScheduleForm.new

    binding.pry
  end

  def create
    @schedule_form = ScheduleForm.new(schedule_params)
    if @schedule_form.save
      redirect_to admin_schedules_path
    end
  end

  def edit
    @schedule_form = ScheduleForm.new(schedule: @schedule)
  end

  # def update
  #   if @schedule.update(schedule_params)
  #     redirect_to admin_schedules_path
  #   else
  #     render :edit
  #   end
  # end

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
      params.require(:schedule).permit(:start_time, :opponent, stocks_attributes: [:grade, :price, :remain])
    end

    def load_schedule
      @schedule = Schedule.find(params[:id])
    end
end
