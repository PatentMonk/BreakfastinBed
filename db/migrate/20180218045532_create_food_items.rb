class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.decimal :price, precision: 16, scale: 2
      t.references :food_itemable, polymorphic: true, index: true
      t.string :image_url
      t.string :type
      t.binary :uuid, limit: 16

      t.timestamps
    end

    add_index :food_items, :uuid, unique: true
  end
end
