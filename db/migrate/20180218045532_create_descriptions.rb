class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.text :words
      t.integer :connection_id
      t.string :connection_type
      t.string :uuid, default: "UUID()"

      t.timestamps
    end
  end
end
