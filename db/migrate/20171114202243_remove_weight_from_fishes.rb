class RemoveWeightFromFishes < ActiveRecord::Migration[5.1]
  def change
    remove_column :fishes, :weight_in_grams, :integer
  end
end
