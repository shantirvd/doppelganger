class CreateDoppelgs < ActiveRecord::Migration[7.0]
  def change
    create_table :doppelgs do |t|
      t.string :nickname
      t.string :city
      t.integer :radius
      t.text :description
      t.string :specialty
      t.string :celebrity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
