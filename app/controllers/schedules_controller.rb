class SchedulesController < ApplicationController
  def index
  end

  def new
    @schedule = Schedule.new
    @team = Team.all
  end

  def create
    @schedule = Schedule.new(schedule_params)
    

  
  def show
  end

  
end
