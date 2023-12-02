require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    created_at { "2023-10-31 16:34:11" }
    updated_at { "2023-10-31 16:34:11" }
  end
end
