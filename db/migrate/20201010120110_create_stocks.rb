class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string     :grade,  null:false
      t.integer    :price,  null:false
      t.integer    :remain, null:false

      t.timestamps
    end
  end
end
