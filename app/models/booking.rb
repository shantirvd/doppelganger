class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :drag
  validates :end_date, comparison: { greater_than: :start_date }
  validates :location, presence: true

end
