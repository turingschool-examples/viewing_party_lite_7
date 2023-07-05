FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    username {Faker::Internet.username}
    email {Faker::Internet.email}
  end

  factory :movie do
    title {Faker::Movie.title}
    genre {Faker::Book.genre}
    summary {Faker::Hipster.sentence}
    cast {Faker::Name.name}   # FactoryBot.create_list(:cast, 10)
    reviews {Faker::Hipster.sentence}
    reviewers {Faker::Name.name} # FactoryBot.create_list(:reviewers, 10)
    rating {Faker::Number.between(from: 1, to: 10)}     #(0..10).sample(1)} # Controller/Model logic
    runtime {Faker::Number.between(from: 90, to: 200)}
  end

  factory :viewing_party do
    duration {Faker::Number.between(from: 200, to: 400)}
    date_time {Faker::Time.backward(days: 14, period: :evening)}
    movie_id 
  end

  factory :viewing_users do
    viewing_party
    user
  end
end