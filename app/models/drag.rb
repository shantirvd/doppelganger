class Drag < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :nickname, presence: true
  validates :city, presence: true
  validates :radius, comparison: { greater_than: 5 }
  validates :specialty, presence: true, inclusion: {
    in: %w[singing dancing comedy doppelganger acrobatics]
  }
end
