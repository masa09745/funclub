class Schedule < ApplicationRecord
  has_many :stocks, dependent: :destroy
  accepts_nested_attributes_for :stocks

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      schedule = Schedule.new
      row_hash = row.to_hash.slice(*CSV_HEADER.keys)
      schedule.attributes = row_hash.transform_keys(&CSV_HEADER.method(:[]))
      schedule.save
    end
  end

  CSV_HEADER = {
    "試合日" => 'match_date',
    "対戦相手" => 'opponent'
  }

end
