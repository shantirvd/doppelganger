class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.date :start_time
      t.date :end_time
      t.text :location
      t.references :user, null: false, foreign_key: true
      t.references :drags, null: false, foreign_key: true

      t.timestamps
    end
  end
end
