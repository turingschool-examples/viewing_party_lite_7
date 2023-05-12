# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists', :vcr do
    attrs = {
      title: 'Interstellar',
      vote_average: 9.5,
      summary: nil,
      poster_path: 'whatever.jpg',
      id: 238,
      runtime: 86,
      genres: [
        {
          "id": 18,
          "name": "Drama"
        }
      ],
      review_count: 3
    }
    search = MovieService.movie_search(238)
    cast = MovieService.cast_search(238)
    reviews = MovieService.reviews_search(238)
    movie = Movie.new(attrs, cast, reviews)
    
    expect(movie).to be_a Movie
    expect(movie.title).to eq('Interstellar')
    expect(movie.vote_average).to eq(9.5)
    expect(movie.summary).to eq(nil)
    expect(movie.poster_path).to eq('whatever.jpg')
    expect(movie.id).to eq(238)
    expect(movie.runtime).to eq("1 hours, 26 minutes")
    expect(movie.genres).to eq("Drama")
    expect(movie.cast).to eq(cast[:cast].first(10))
    expect(movie.review_count).to eq(3)
    expect(movie.reviews).to eq(reviews[:results])
  end

  describe "time_conversion method", :vcr do
    it "converts an interger amount into hours and minutes" do
      search = MovieService.movie_search(238)
      cast = MovieService.cast_search(238)
      reviews = MovieService.reviews_search(238)
      movie = Movie.new(search, cast, reviews)
      fifty_five = 55
      expect(movie.time_conversion(fifty_five)).to eq("0 hours, 55 minutes")
    end
  end

  describe "get_genres method", :vcr do
    it "extracts all genre names from nested hash and formats them" do
      search = MovieService.movie_search(238)
      cast = MovieService.cast_search(238)
      reviews = MovieService.reviews_search(238)
      movie = Movie.new(search, cast, reviews)
      genres = [
        {
          "id": 18,
          "name": "Drama"
        },
        {
          "id": 99,
          "name": "Pokemon"
        },
        {
          "id": 1,
          "name": "Scooby Doo"
        }
      ]
      expect(movie.get_genres(genres)).to eq("Drama, Pokemon, Scooby Doo")
    end
  end
end
