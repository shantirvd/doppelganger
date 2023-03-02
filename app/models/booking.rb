class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :drag
  validates :end_time, comparison: { greater_than: :start_time }
  validates :location, presence: true
end
