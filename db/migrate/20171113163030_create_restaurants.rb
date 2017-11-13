class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :img_url
      t.string :url
      t.string :coordinates
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
