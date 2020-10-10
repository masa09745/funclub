class CreateStockDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_details do |t|
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
