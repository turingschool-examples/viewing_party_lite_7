FactoryBot.define do
  factory :movie_watch_party do
    watch_party_id { rand(1..100) }
    movie_id { rand(1..100) }
    user_id { rand(1..100) }
    user_status { rand(0..1) }
  end
end