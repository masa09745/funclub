class ScheduleForm
  include ActiveModel::Model
  FORM_COUNT = 4

  concerning :ScheduleBuilder do
    attr_accessor :start_time, :opponent

    def schedule
      @schedule ||= Schedule.new
    end
  end

  concerning :StocksBuilder do
    attr_accessor :stocks

    def initialize(attributes = {})
      super attributes
      self.stocks  = FORM_COUNT.times.map {Stock.new() } unless self.stocks.present?
    end

    def stocks_attributes=(attributes)
      self.stocks = attributes.map { |_, v| Stock.new(v) }
    end
  end

  def save
    return false if invalid?

    schedule.assign_attributes(schedule_params)
    build_associations

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

  def build_associations
    schedule.stocks << stocks
  end

end



