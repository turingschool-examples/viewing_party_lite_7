FactoryBot.define do
  factory :party do
    movie_id { 1 }
    host_id { 1 }
    day { "MyString" }
    time { "MyString" }
    duration { 1 }
  end
end
