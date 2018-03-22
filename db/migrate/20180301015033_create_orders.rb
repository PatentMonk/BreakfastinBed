class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :purchaser, references: :user
      t.references :restaurant, foreign_key: true
      t.binary :uuid, limit: 16

      t.timestamps
    end

    add_foreign_key :orders, :users, column: :purchaser_id
    add_index :orders, :uuid, unique: true
  end
end
