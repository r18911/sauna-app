FactoryBot.define do
  factory :room do
    name { "シングルルーム" }
    size { "#{rand(20..50)}㎡" }
    bed_type { ["シングル", "ダブル", "ツイン"].sample }
    facilities { "Wi-Fi, エアコン, テレビ, バスタブ" }
    price { 5000 }
    capacity { rand(1..4) }
  end
end