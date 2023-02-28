class RemoveCelebrityColumnToDrags < ActiveRecord::Migration[7.0]
  def change
    remove_column :drags, :celebrity
  end
end
