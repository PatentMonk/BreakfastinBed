class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :food_type
      t.binary :uuid, limit: 16

      t.timestamps
    end

    add_index :restaurants, :uuid, unique: true
  end
end
