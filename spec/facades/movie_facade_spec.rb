require 'rails_helper'

RSpec.describe 'MovieFacade', :vcr do
  it "creates Movie poros for top rated movies" do
    top_rated_movies = MovieFacade.new.top_rated_movies

    expect(top_rated_movies.first).to be_a(Movie)
    expect(top_rated_movies.last).to be_a(Movie)
  end

  it "creates Movie poros for search_by_title" do
    ocean_movies = MovieFacade.new.search_by_title('ocean')

    expect(ocean_movies).to be_an(Array)
    expect(ocean_movies.first).to be_a(Movie)
    expect(ocean_movies.last).to be_a(Movie)
  end
end