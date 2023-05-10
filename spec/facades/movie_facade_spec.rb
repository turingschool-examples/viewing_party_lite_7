require 'rails_helper'
require './app/facades/movie_facade'

RSpec.describe MovieFacade do

  it 'displays movie attributes', :vcr do
    movie = MovieFacade.get_movie('238')

    expect(movie.title).to eq('The Godfather')
    expect(movie.vote_average).to eq(8.713)
  end

  it 'creates top rated movies poros', :vcr do
    top_rated = MovieFacade.top_rated
  #  require 'pry'; binding.pry
    expect(top_rated.first).to be_a(MovieDetail)
  end
end 