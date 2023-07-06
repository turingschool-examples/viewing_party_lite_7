FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    duration { Faker::Number.within(range: 1..300) }
    rating { Faker::Number.within(range: 1..100) }
    genre { Faker::Superhero.descriptor }
    summary { Faker::Movies::Lebowski.quote }
    cast { Array.new(10) { Faker::Movies::StarWars.character } }
  end
end
