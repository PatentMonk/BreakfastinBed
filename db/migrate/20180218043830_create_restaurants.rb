class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :address_id
      t.string :food_type
      t.string :uuid, default: "UUID()"

      t.timestamps
    end
  end
end
