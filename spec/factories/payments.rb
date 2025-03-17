FactoryBot.define do
  factory :payment do
    amount { 3000 }
    token { "tok_abcdefghijk00000000000000000" }
    association :reservation
  end
end
