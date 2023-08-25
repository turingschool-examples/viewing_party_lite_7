FactoryBot.define do
  factory :viewing_party do
    date { Faker::Date.forward(days: 30) }
    movie_id { Faker::Number.number(digits: 4) }
    duration { Faker::Number.number(digits: 3) }
    association :user
  end
end
