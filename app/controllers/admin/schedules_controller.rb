class Admin::SchedulesController < ApplicationController
  def index
    from = Time.current.at_beginning_of_month
    to = (from + 1.month)
    @schedules = Schedule.where(match_date: from...to).order(match_date: :ASC)
    
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

  private
    def schedule_params
      params.require(:schedule).permit(:match_date, :opponent, stocks_attributes:[
        :grade,
        :price,
        :remain
      ])
    end


end
