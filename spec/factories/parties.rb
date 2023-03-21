FactoryBot.define do
  factory :party do
    movie_id { Faker::Number.between(from: 1, to: 500) }
    host_id { 1 }
    day { "MyString" }
    time { "MyString" }
    duration { 1 }
  end
end
