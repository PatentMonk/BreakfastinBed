class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.text :content
      t.references :descriptionable, polymorphic: true, index: { name: 'index_description_on_descriptionable_type_and_descriptionable_id' }
      t.binary :uuid, limit: 16

      t.timestamps
    end

    add_index :descriptions, :uuid, unique: true
  end
end
