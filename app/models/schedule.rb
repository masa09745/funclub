class Schedule < ApplicationRecord
  has_many :stocks, dependent: :destroy

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      schedule = find_by(id: row["id"]) || new
      schedule.attributes = row.to_hash.slice(*updatable_attributes)
      schedule.save
    end
  end

  def self.updatable_attributes
    ["start_time", "opponent"]
  end

end
