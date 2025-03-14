class Room < ApplicationRecord
  has_many_attached :images

  has_many :reservations
  validates :name, :size, :bed_type, :facilities, :price, :capacity, presence: true
end
