class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :doppelg
  validates :end_date, comparison: { greater_than: :start_date }
  validates :location, presence: true

end
