FactoryBot.define do
  factory :reservation do
    association :user
    association :room
    start_time { Faker::Time.forward(days: 3, period: :morning) }
    # end_time { Faker::Time.forward(days: 4, period: :morning) }
    end_time do
      start = start_time || Faker::Time.forward(days: 3, period: :morning)
      nights = rand(1..5) # 1〜5泊
      Faker::Time.between(from: start + 12.hours, to: start + nights.days + 12.hours)
    end
    number_of_people { rand(1..4) }
    status { 0 }
  end
end