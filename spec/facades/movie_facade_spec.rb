require 'rails_helper'

RSpec.describe 'MovieFacade', :vcr do
  it "creates Movie poros for top rated movies" do
    top_rated_movies = MovieFacade.new.top_rated_movies

    expect(top_rated_movies.first).to be_a(Movie)
    expect(top_rated_movies.last).to be_a(Movie)
  end

  it "creates Movie poros for movie_search" do
    ocean_movies = MovieFacade.new.movie_search('ocean')

    expect(ocean_movies.first).to be_a(Movie)
    expect(ocean_movies.last).to be_a(Movie)
  end
end