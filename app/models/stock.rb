class Stock < ApplicationRecord
  belongs_to :schedule, inverse_of: :stocks
  has_many :stock_details, inverse_of: :stock
  has_many :orders
end
