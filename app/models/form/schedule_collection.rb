class Form::ScheduleCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :schedules

  def initialize(attributes = {})
    super attributes
    self.schedules = FORM_COUNT.times.map { Schedule.new() } unless self.schedules.present?
  end

  def schedules_attributes=(attributes)
    self.schedules = attributes.map { |_, v| Schedule.new(v) }
  end

  def save
    Schedule.transaction do
      self.schedules.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end