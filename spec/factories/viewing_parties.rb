# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party do
    movie_title { Faker::Movie.title }
    duration { Faker::Number.within(range: 1..1000) }
    date_time { Faker::DateTime.forward(days: 50) }
  end
end
