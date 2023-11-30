require "factory_bot_rails"
require "faker"

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    duration { Faker::Number.between(from: 100, to: 200) }
    genre { Faker::Book.genre }
    vote { Faker::Number.between(from: 0.1, to: 10.0) }
    cast { Array.new(10).map { |_| Faker::Name.name } }
    summary { Faker::Lorem.paragraph }
    reviews { Array.new(3).map { |_| [Faker::Name.name, Faker::Lorem.paragraph] } }
  end
end
