class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :match_date, null: false
      t.references :opponent, foreign_key:{to_table: :teams}
      t.timestamps
    end
  end
end
