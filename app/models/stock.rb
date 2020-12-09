class Stock < ApplicationRecord
  belongs_to :schedule, inverse_of: :stocks
  has_many :orders
end
