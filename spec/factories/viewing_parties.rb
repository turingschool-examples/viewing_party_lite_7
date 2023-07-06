FactoryBot.define do 
  factory :viewing_party do 
    duration { rand(90..180)}
    start_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    # start_time { 18:00:00 }
    start_time { Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short) }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end