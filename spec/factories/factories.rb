FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :viewing_party do
    movie_id { [11, 13, 122, 155, 238, 240, 278, 424, 497, 680, 769].sample }
    duration { Faker::Number.within(range: 30..200) }
    start_time {
      Faker::Time.forward(days: 30, period: :evening, format: :long)
    }
  end

  factory :user_viewing_party do
    user_type { ['visitor', 'host'].sample }
  end

  factory :movie do
    id { Faker::Number.within(range: 11..10000) }
    title { Faker::Movie.title }
    runtime { Faker::Number.within(range: 30..200) }
    image_url { Faker::Internet.url }
    rating { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    genres { Array.new(3, Faker::Book.genre) }
    summary { Faker::Lorem.paragraph }
    cast { Array.new(10, Faker::Name.name) }
    reviews { Array.new(5, Faker::Lorem.paragraph) }
  end

  factory :user_movies do
    type { ['details', 'search', 'top rated'].sample }
    data { Array.new(5, create(:movie)) }
    user
    query { Faker::Lorem.words }
  end
end
