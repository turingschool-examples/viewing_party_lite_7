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
end
