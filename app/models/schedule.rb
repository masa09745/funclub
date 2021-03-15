class Schedule < ApplicationRecord
  has_many :stocks, dependent: :destroy
  accepts_nested_attributes_for :stocks

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      schedule = find_by(id: row["id"]) || new
      schedule.attributes = row.to_hash.slice(*updatable_attributes)
      schedule.save
    end
  end


  def self.updatable_attributes
    ["match_date", "opponent"]
  end

end
