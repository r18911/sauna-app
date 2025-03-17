class Payment < ApplicationRecord
  attr_accessor :token
  belongs_to :reservation

  validates :amount, presence: true
  validates :token, presence: true
end
