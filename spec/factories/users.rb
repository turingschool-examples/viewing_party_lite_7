FactoryBot.define do 
  factory :user do 
    name { Faker::Name.first_name }
    email {}
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end