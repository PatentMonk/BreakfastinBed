class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :month
      t.string :year
      t.string :first_name
      t.string :last_name
      t.integer :address_id
      t.integer :purchaser_id
      t.string :uuid, default: "UUID()"

      t.timestamps
    end
  end
end
