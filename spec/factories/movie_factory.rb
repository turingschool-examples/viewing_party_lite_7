require "factory_bot_rails"
require "faker"

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    runtime { Faker::Number.between(from: 100, to: 200) }
    poster_path { "/posters" }
  end
end
