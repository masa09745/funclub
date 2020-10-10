class Stock < ApplicationRecord
  belongs_to :schedule
  has_many :stock_details
  has_many :orders
end
