FactoryBot.define do
  factory :party do
    duration { Faker::Number.between(from: 1, to: 300) }
    date { Faker::Date.between(from: Date.today, to: 30.days.from_now) }
    start_time { Faker::Time.between(from: DateTime.now, to: 30.days.from_now) }
    movie_id { Faker::Number.between(from: 1, to: 1000) }
  end
end