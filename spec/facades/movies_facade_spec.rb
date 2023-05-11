require 'rails_helper'

RSpec.describe MoviesFacade do
  describe '#initialize' do
    it 'creates an instance of a MovieFacade object with a given id' do
      facade = MoviesFacade.new('Tremors')
      expect(facade).to be_a(MoviesFacade)
    end
  end

  describe 'Top movies object creation' do
    it 'returns an array of the top movies in movie objects' do
      VCR.use_cassette('TmbdService/Establish_connection/can_retreive_a_list_of_the_top_20_movies') do

        top_movies = MoviesFacade.new.movies
        expect(top_movies).to be_an(Array)
        expect(top_movies.first).to be_a(Movie)
        expect(top_movies.count).to eq(20)
      end
    end
  end

  describe 'Search movie object creation' do
    it 'returns an array of movies searched with a specific keyword' do
      VCR.use_cassette('search_movies_tremors') do

        search_movies = MoviesFacade.new('Tremors').movies
        expect(search_movies).to be_an(Array)
        expect(search_movies.first).to be_a(Movie)
        expect(search_movies.count).to eq(20)
      end
    end
  end
end
