require "factory_bot_rails"
require "faker"

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(name: name, separators: ["+"]) }
  end
end
