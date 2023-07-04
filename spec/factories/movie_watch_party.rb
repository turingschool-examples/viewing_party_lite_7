FactoryBot.define do
  factory :movie_watch_party do
    watch_parties_id { rand(1..100) }
    movies_id { rand(1..100) }
    users_id { rand(1..100) }
    user_status { rand(0..1) }
  end
end