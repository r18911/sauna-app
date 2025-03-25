class Payment < ApplicationRecord
  attr_accessor :token
  belongs_to :reservation

  validates :amount, :token, presence: true

  # 🔹 支払いステータスのenum定義
  enum payment_status: { unpaid: 0, paid: 1 }

end
