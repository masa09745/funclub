class ScheduleForm
  include ActiveModel::Model

  concerning :ScheduleBuilder do
    def schedule
      @schedule ||= Schedule.new
    end
  end

  attr_accessor :start_time, :opponent
  validates :start_time, presence: true
  validates :opponent, presence: true


  concerning :StocksBuilder do
    attr_reader :stocks_attributes

    def stocks
      @stocks_attributes ||= Stock.new
    end

    def stocks_attributes=(attributes)
      @stocks_attributes = Stock.new(attributes)
    end
  end

  attr_accessor :grade, :price, :remain

  def save
    return false if invalid?

    schedule.assign_attributes(schedule_params)
    build_asscociations

    if schedule.save
      true
    else
      false
    end
  end

  private

  def schedule_params
    {
      start_time: start_time,
      opponent: opponent
    }
  end

  def build_asscociations
    schedule.stocks << stocks if stocks[:grade, :price, :remain].present?
  end

end



