FactoryBot.define do
  factory :viewing_party do
    event_datetime { Faker::Time.between(from: DateTime.now - 365, to: DateTime.now) }
    duration { Faker::Number.number(digits: 3) }
    movie_id { 0 }
  end
end