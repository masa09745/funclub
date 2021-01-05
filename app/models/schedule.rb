class Schedule < ApplicationRecord
  has_many :stocks, inverse_of: :schedule, dependent: :destroy
  accepts_nested_attributes_for :stocks

end
