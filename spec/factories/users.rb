FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "test" }
    password_confirmation { "test" }
  end
end
