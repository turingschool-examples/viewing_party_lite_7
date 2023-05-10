require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  before(:all) do
    @movie_facade = MovieFacade.new
  end

  describe 'search' do
    it 'returns an array of movie objects' do
      movies = @movie_facade.search('King')
      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
    end
  end
  
  describe 'top_rated' do
    it 'returns an array of movie objects' do
      movies = @movie_facade.top_rated
      expect(movies).to be_an(Array)
      expect(movies).to all(be_a(Movie))
    end
  end
end