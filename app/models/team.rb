class Team < ApplicationRecord
  has_many :opponent_schedules, class_name: 'Schedule', foreign_key: 'opponent_id'
end
