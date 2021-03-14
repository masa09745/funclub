class Schedule < ApplicationRecord
  has_many :stocks, dependent: :destroy
  accepts_nested_attributes_for :stocks
end
