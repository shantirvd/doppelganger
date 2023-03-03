class ChangeTypeDatesInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :booking_date, :string
    change_column :bookings, :start_time, :string
    change_column :bookings, :end_time, :string
  end
end
