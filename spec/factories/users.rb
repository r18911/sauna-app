FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
  end
end