require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  describe 'search' do
    it 'returns an array of movie objects' do
      movie_facade = MovieFacade.new
      movies = movie_facade.search('King')
      expect(movies).to be_an(Array)
    end
  end

  describe "top_rated" do
    it "creates top rated movies" do
      movie_facade = MovieFacade.new
      movies = movie_facade.top_rated

      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
    end
  end

end