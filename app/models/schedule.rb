class Schedule < ApplicationRecord
  has_many :stocks, inverse_of: :schedule
  accepts_nested_attributes_for :stocks

  belongs_to :team, foreign_key: 'opponent_id'

end
