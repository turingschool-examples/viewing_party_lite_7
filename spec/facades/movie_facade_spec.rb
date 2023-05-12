require 'rails_helper'

RSpec.describe 'MovieFacade', :vcr do
  before(:all) do
    @movie_facade = MovieFacade.new
  end

  describe 'get results' do
    it "creates Movie poros for either top rated or searched" do
      top_rated = @movie_facade.get_results('top%20rated')
      searched = @movie_facade.get_results('searched')
      nada = @movie_facade.get_results('')

      expect(top_rated).to be_an(Array)
      expect(top_rated).to all(be_a(Movie))
      expect(top_rated.count).to be <= 20

      expect(searched).to be_an(Array)
      expect(searched).to all(be_a(Movie))
      expect(searched.count).to be <= 20

      expect(nada).to be_an(Array)
      expect(nada.empty?).to eq(true)
    end
  end

  describe 'top_rated_movies' do
    it "creates Movie poros for top rated movies" do
      top_movies = @movie_facade.top_rated_movies

      expect(top_movies).to be_an(Array)
      expect(top_movies).to all(be_a(Movie))
      expect(top_movies.count).to be <= 20
    end
  end

  describe 'search_by_title' do 
    it "creates Movie poros for search_by_title" do
      ocean_movies = @movie_facade.search_by_title('ocean')

      expect(ocean_movies).to be_an(Array)
      expect(ocean_movies).to all(be_a(Movie))
      expect(ocean_movies.count).to be <= 20
    end
  end
end