class SchedulesController < ApplicationController
  def index
    @schedules = Scheudle.all
  end

  def show
  end

end