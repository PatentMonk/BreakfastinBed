class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.datetime :monday_opens_at
      t.datetime :monday_closes_at
      t.datetime :tuesday_opens_at
      t.datetime :tuesday_closes_at
      t.datetime :wednesday_opens_at
      t.datetime :wednesday_closes_at
      t.datetime :thursday_opens_at
      t.datetime :thursday_closes_at
      t.datetime :friday_opens_at
      t.datetime :friday_closes_at
      t.datetime :saturday_opens_at
      t.datetime :saturday_closes_at
      t.datetime :sunday_opens_at
      t.datetime :sunday_closes_at
      t.references :restaurant, foreign_key: true
      t.binary :uuid, limit: 16

      t.timestamps
    end

    add_index :schedules, :uuid, unique: true
  end
end
