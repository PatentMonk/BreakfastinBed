class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :month
      t.string :year
      t.string :first_name
      t.string :last_name
      t.references :purchaser, references: :user
      t.binary :uuid, limit: 16

      t.timestamps
    end

    add_foreign_key :credit_cards, :users, column: :purchaser_id
    add_index :credit_cards, :uuid, unique: true
  end
end
