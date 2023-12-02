require 'faker'

FactoryBot.define do
  factory :viewing_party do
    party_duration { Faker::Number.number(digits: 3) }
    start_time { '12:00' }
    movie_title { Faker::Movie.title }
    movie_id { Faker::Number.number(digits: 3) }
  end
end
