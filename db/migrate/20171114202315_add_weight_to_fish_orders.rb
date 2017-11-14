class AddWeightToFishOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :fish_orders, :weight_in_grams, :integer
  end
end
