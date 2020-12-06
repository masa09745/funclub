class StockDetail < ApplicationRecord
  belongs_to :stock, inverse_of: :stock_details
end
