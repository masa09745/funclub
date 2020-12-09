class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string     :grade,    null: true
      t.integer    :price,    null: true
      t.integer    :remain,   null: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
