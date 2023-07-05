FactoryBot.define do 
  factory :viewing_party do 
    duration {}
    start_date {}
    start_time {}
    user {}
    movie {}
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end