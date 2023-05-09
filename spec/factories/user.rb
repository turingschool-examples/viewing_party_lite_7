FactoryBot.define do
  factory :user do
    sequence :id
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
