FactoryBot.define do
  factory :viewing_party do
    event_datetime {Faker::Name.name}
    email {Faker::Internet.email}
  end
end