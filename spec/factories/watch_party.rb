FactoryBot.define do
  factory :watch_party do
    date { Faker::Date.between(from: Date.today, to: 14.days.from_now) }
    duration { Faker::Number.within(range: 1..300) } # duration in minutes
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 14) }
    movie_id { rand(1..100) }
  end
end
