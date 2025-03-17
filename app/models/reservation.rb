class Reservation < ApplicationRecord
  belongs_to :user  # ユーザーとの関連
  belongs_to :room  # 部屋との関連
  has_one :payment, dependent: :destroy

  # 🔹 バリデーション（予約時に必要なデータをチェック）
  validates :start_time, :end_time, :number_of_people, presence: true
end
