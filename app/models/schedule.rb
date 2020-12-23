class Schedule < ApplicationRecord
  has_many :stocks, inverse_of: :schedule
  accepts_nested_attributes_for :stocks

end
