FactoryBot.define do
  factory :room do
    name       { Faker::Space.star }
    size       { "#{Faker::Number.between(from: 15, to: 80)}㎡" }
    bed_type   { Faker::Commerce.product_name }
    facilities { Array.new(3) { Faker::Appliance.equipment }.join(', ') }
    price      { Faker::Number.between(from: 3000, to: 50000) }
    capacity   { Faker::Number.between(from: 1, to: 10) }
  end
end