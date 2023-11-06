# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    id { nil }
    title { Faker::Movie.title }
    vote_average { Faker::Number.between(from: 1, to: 10) }
    runtime { Faker::Number.between(from: 1, to: 160) }
    genres { [Faker::Movie.genre, Faker::Movie.genre].uniq.join(', ') }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
