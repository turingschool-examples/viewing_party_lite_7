FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(name: name, separators: ["-"]) }
    password { Faker::Internet.password(min_length: 8) }
  end
end
