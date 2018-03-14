class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :postal
      t.integer :user_id
      t.string :uuid, default: "UUID()"

      t.timestamps
    end
  end
end
