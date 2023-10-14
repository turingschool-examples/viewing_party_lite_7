require 'rails_helper'

RSpec.describe MovieDetails do 
  it "exists" do 
    attrs = {
    "genres": [
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 53,
            "name": "Thriller"
        }
    ],
    "id": 155,
    "overview": "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
    "poster_path": "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
    "runtime": 152,
    "title": "The Dark Knight",
    "vote_average": 8.512
  }

  movie_details = MovieDetails.new(attrs)

  expect(movie_details).to be_a MovieDetails
  expect(movie_details.id).to eq(155)
  expect(movie_details.title).to eq("The Dark Knight")
  expect(movie_details.vote_average).to eq(8.512)
  expect(movie_details.runtime).to eq(152)
  expect(movie_details.summary).to eq("Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",)
  expect(movie_details.genres[0]).to eq({
                                      "id": 18,
                                      "name": "Drama"
                                  })
  expect(movie_details.poster_path).to eq("/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
  end
end