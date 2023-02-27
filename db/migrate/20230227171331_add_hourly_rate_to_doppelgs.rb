class AddHourlyRateToDoppelgs < ActiveRecord::Migration[7.0]
  def change
    add_column :doppelgs, :hourly_rate, :integer
  end
end
