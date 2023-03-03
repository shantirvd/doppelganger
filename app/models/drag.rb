class Drag < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :nickname, presence: true
  validates :city, presence: true
  validates :radius, comparison: { greater_than: 5 }
  validates :specialty, presence: true, inclusion: {
    in: %w[singing dancing comedy doppelganger acrobatics bingo]
  }
end
