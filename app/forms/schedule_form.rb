class ScheduleForm
  include ActiveModel::Model
  FORM_COUNT = 4

  delegate :persisted?, to: :schedule


  def schedule
    @schedule  ||= Schedule.new
  end

  def initialize(attributes = {})
    super attributes
    self.stocks = FORM_COUNT.times.map{Stock.new()} unless self.stocks.present?
  end

  def stocks_attributes=(attributes)
    self.stocks = attributes.map{ |_, v| Stock.new(v)}
  end

  attr_accessor :start_time, :opponent, :stocks

  def save
    return if invalid?

    schedule.assign_attributes(schedule_params)
    build_association

    schedule.save ? true : false
  end

  def to_model
    schedule
  end

  private
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



