FactoryBot.define do
  factory :party do
    start_time { Faker::Time.between(from: Time.now - 240, to: Time.now + 240) }
    date { Faker::Time.between(from: Date.now - 10, to: Date.now + 10) }
    duration { Faker::Number.between(from: 90, to: 240) }
    movie_id { Faker::Number.between(from: 100, to: 1000) }
  end
end
