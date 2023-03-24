FactoryBot.define do
  factory :party do
    movie_id { Faker::Number.between(from: 1, to: 500) }
    host_id { Faker::Number.between(from: 1, to: 10) }
    day { Faker::Date.forward(days: 21) }
    time { Faker::Time.forward(period: :evening) }
    duration { Faker::Number.between(from: 30, to: 300) }
  end
end
