class ScheduleForm
  include ActiveModel::Model
  FORM_COUNT = 4

  attr_accessor :start_time, :opponent

  validates :start_time, presence: true
  validates :opponent, presence: true

  delegate :persisted?, to: :schedule

  def initialize(attributes = nil, schedule: Schedule.new)
    @schedule = schedule
    attributes ||= default_attributes
    super(attributes)
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

  def build_associations
    schedule.stocks << stocks
  end

end



