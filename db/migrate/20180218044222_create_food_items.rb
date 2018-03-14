class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.decimal :price
      t.integer :description_id
      t.string :image_url
      t.string :uuid, default: "UUID()"

      t.timestamps
    end
  end
end
