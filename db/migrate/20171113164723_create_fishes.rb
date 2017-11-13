class CreateFishes < ActiveRecord::Migration[5.1]
  def change
    create_table :fishes do |t|
      t.string :name

      t.timestamps
    end
  end
end
