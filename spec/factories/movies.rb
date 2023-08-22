FactoryBot.define do
  factory :movie do
    title { "MyString" }
    vote_average { 1.5 }
    runtime { 1 }
    genres { "MyString" }
    overview { "MyText" }
    cast_members { "MyString" }
    vote_count { 1 }
    reviews { "MyString" }
  end
end
