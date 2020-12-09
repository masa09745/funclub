class SchedulesController < ApplicationController
  def index
    from = Time.current.at_beginning_of_month
    to = (from + 1.month)
    @schedules = Schedule.includes(:team).where(match_date: from...to).order(match_date: :ASC)
  end

  def new
    @schedule = Schedule.new
    stock = @schedule.stocks.build
    @team = Team.all
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    end
  end

  def show
  end

  private

  def schedule_params
    params.require(:schedule).permit(:match_date, :opponent_id, stocks_attributes:[
      :grade,
      :price,
      :remain
      ]
    )
  end

end