class Schedule < ApplicationRecord
  has_many :stocks

  belongs_to :team, foreign_key: 'opponent_id'

end
