class ManagementsController < ApplicationController
  def index
    @schedules = Schedule.all
  end
end
