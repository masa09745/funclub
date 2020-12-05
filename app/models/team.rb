class Team < ApplicationRecord
  has_many :schedules, foreign_key: 'opponent_id'
end
