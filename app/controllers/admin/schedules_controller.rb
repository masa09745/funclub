class Admin::SchedulesController < ApplicationController
  before_action  :find_schedule, only: [:edit, :update, :destroy]

  def index
    @schedules = Schedule.all
    
  end

  def new
    @schedule = Schedule.new
    @schedule.stocks.build
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
    @schedule = Schedule.fin(params[:id])
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to admin_schedules_path
  end

  def import
    Schedule.import(params[:file])
    redirect_to admin_schedules_path
  end

  private
    def schedule_params
      params.require(:schedule).permit(:start_time, :opponent, stocks_attributes:[
        :grade,
        :price,
        :remain
      ])
    end

    def find_schedule
      @schedule = Schedule.find(params[:id])
    end


end
