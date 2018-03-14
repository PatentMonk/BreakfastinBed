class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :purchaser_id
      t.integer :restaurant_id
      t.integer :payment_id
      t.string :uuid, default: "UUID()"

      t.timestamps
    end
  end
end
