class AddWeightToFishes < ActiveRecord::Migration[5.1]
  def change
    add_column :fishes, :weight_in_grams, :integer
  end
end
