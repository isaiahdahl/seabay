class RemoveCoordinatesFromRestaurants < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :coordinates, :string
  end
end
