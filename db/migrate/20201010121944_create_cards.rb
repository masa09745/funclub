class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string     :customer, null: false
      t.string     :card,     null: false
      t.belongs_to :user,     null: false, unique: true, foreign_key: true

      t.timestamps
    end
  end
end
