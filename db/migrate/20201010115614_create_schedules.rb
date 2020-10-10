class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string   :opponent,   null: false
      t.datetime :match_date, null: false

      t.timestamps
    end
  end
end
