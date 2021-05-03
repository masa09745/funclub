class Stock < ApplicationRecord
  belongs_to :schedule
  has_many :orders

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      stock = find_by(id: row["id"]) || new
      stock.attributes = row.to_hash.slice(*updatable_attributes)
      stock.save
    end
  end

  def self.multi_update(stocks_params)
    stocks_params.to_h.map do |id, stock_param|
      stock = self.find(id)
      stock.update(stock_param)
    end
  end

  def self.updatable_attributes
    ["grade", "price", "remain", "schedule_id"]
  end
end

