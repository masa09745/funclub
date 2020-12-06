class Stock < ApplicationRecord
  belongs_to :schedule, inverse_of: :stocks
  has_many :stock_details, inverse_of: :stock
  accepts_nested_attributes_for :stock_details
  has_many :orders
end
