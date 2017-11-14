class CreateFishOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :fish_orders do |t|
      t.references :fish, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
