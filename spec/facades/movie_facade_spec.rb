require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'Top movies object creation' do
    it 'returns an array of the top movies in movie objects' do
      VCR.use_cassette('TmbdService/Establish_connection/can_retreive_a_list_of_the_top_20_movies') do

        top_movies = MovieFacade.top_rated_movies
        expect(top_movies).to be_an(Array)
        expect(top_movies.first).to be_a(Movie)
        expect(top_movies.count).to eq(20)
      end
    end
  end

  describe 'Search movie object creation' do
    it 'returns an array of movies searched with a specific keyword' do
      VCR.use_cassette('search_movies_tremors') do
        
        search_movies = MovieFacade.search_movies('Tremors')
        expect(search_movies).to be_an(Array)
        expect(search_movies.first).to be_a(Movie)
        expect(search_movies.count).to eq(20)
      end
    end

    describe 'Find movie by id' do
      it 'returns a single movie object' do
        VCR.use_cassette('find_movie_by_id_550') do
          movie = MovieFacade.find_movie(550)
          
          expect(movie.id).to be_a(Integer)
          expect(movie.title).to be_a(String)
          expect(movie.vote_average).to be_a(Float)
          expect(movie.runtime).to be_a(Integer)
          expect(movie.genres).to be_a(Array)
          expect(movie.genres.first).to be_a(String)
          expect(movie.summary).to be_a(String)

        end
      end
    end
  end
end