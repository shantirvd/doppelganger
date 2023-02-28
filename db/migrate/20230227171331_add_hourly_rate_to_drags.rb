class AddHourlyRateToDrags < ActiveRecord::Migration[7.0]
  def change
    add_column :drags, :hourly_rate, :integer
  end
end
