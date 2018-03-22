class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :postal
      t.references :user, foreign_key: true
      t.references :addressable, polymorphic: true, index: true
      t.binary :uuid, limit: 16

      t.timestamps
    end

    add_index :addresses, :uuid, unique: true
  end
end
