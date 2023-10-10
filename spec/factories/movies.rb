FactoryBot.define do
  factory :movie do
    title { "MyString" }
    vote_average { 1.5 }
    runtime { 1 }
    genres { "MyString" }
    description { "MyString" }
  end
end
