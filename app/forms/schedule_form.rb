class ScheduleForm
  include ActiveModel::Model


  attr_accessor :start_time, :opponent, :grade, :price, :remain

  def save!

    return false if invalid?

    schedule = Schedule.new(start_time: start_time, opponent: opponent)
    schedule.stocks.build(grade: grade, price: price, remain: remain).save!

    schedule.save! ? true : false
  end


end



