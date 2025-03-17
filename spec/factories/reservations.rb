FactoryBot.define do
  factory :reservation do
    association :user
    association :room
    start_time { Faker::Time.forward(days: 3, period: :morning) }
    end_time { Faker::Time.forward(days: 4, period: :morning) }
    number_of_people { rand(1..4) }
    status { 0 }
  end
end