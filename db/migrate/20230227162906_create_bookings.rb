class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.date :start_time
      t.date :end_time
      t.date :booking_date
      t.text :location
      t.references :user, null: false, foreign_key: true
      t.references :drag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
