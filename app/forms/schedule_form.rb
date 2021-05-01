class ScheduleForm
  include ActiveModel::Model

  FORM_COUNT = 4

  attr_accessor :start_time, :opponent, :grade, :price, :remain
  delegate :persisted?, to: :schedule

  concerning :ScheduleBuilder do
    def initialize(attributes = nil, schedule: Schedule.new)
      @schedule = schedule
      attributes ||= default_attributes
      super(attributes)
    end
  end

  concerning :StocksBuilder do
    attr_reader :stocks_attributes

    def stocks
      @stocks_attributes = FORM_COUNT.times.map { Stock.new() }
    end

    def stocks_attributes=(attributes)
      @stocks_attributes = attributes.map { |_, v| Stock.new(v) }
    end
  end
  

  def save

    return false if invalid?

    schedule.assign_attributes(schedule_params)
    build_association

    schedule.save ? true : false

  end

  def to_model
    schedule
  end

  private

    attr_reader :schedule

    def default_attributes
      {
        start_time: schedule.start_time,
        opponent: schedule.opponent
      }
    end

    def schedule_params
      {
        start_time: start_time,
        opponent: opponent
      }
    end

    def build_association
      schedule.stocks << stocks
    end


end



