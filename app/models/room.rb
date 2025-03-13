class Room < ApplicationRecord
  has_many_attached :images

  validates :name, :size, :bed_type, :facilities, :price, :capacity, presence: true
end
