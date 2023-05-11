require 'rails_helper'

RSpec.describe TmbdService do
  describe 'Establish connection' do
    it 'can retreive a list of the top 20 movies', :vcr do
      top_movies = TmbdService.top_rated_movies

      expect(top_movies).to be_a(Hash)
      expect(top_movies[:results]).to be_an(Array)
      expect(top_movies[:results].first[:title]).to be_a(String)
      expect(top_movies[:results].count).to eq(20)

      movie = top_movies[:results].first

      expect(movie).to have_key(:id)
      expect(movie).to have_key(:title)
      expect(movie).to have_key(:vote_average)
    end

    it 'can retrieve a list of search results' do
      VCR.use_cassette('search_movies_tremors') do
        search_movies = TmbdService.search_movies('Tremors')

        expect(search_movies).to be_a(Hash)
        expect(search_movies[:results]).to be_an(Array)
        expect(search_movies[:results].first[:title]).to be_a(String)
        expect(search_movies[:results].first[:title]).to eq('Tremors')

        movie = search_movies[:results].first

      expect(movie).to have_key(:id)
      expect(movie).to have_key(:title)
      expect(movie).to have_key(:vote_average)
      end
    end

    it 'can retrieve a single movie through its id' do
      VCR.use_cassette('find_movie_by_id_550') do
        find_movie = TmbdService.find_movie(550)

        expect(find_movie).to be_a(Hash)
        expect(find_movie[:title]).to be_a(String)
        expect(find_movie[:vote_average]).to be_a(Float)
        expect(find_movie[:runtime]).to be_an(Integer)
        expect(find_movie[:genres]).to be_an(Array)
        expect(find_movie[:overview]).to be_an(String)
        expect(find_movie[:poster_path]).to be_an(String)
        expect(find_movie[:overview]).to be_an(String)
      end
    end

    it 'can retrieve all reviews for a movie through its id' do
      VCR.use_cassette('find_reviews_by_id_550') do
        find_reviews = TmbdService.find_reviews(550)

        expect(find_reviews).to be_a(Hash)
        expect(find_reviews[:results].first[:author]).to be_a(String)
        expect(find_reviews[:results].first[:content]).to be_a(String)
      end
    end

    it 'can retrieve all cast members for a movie through its id' do
      VCR.use_cassette('find_cast_by_id_550') do
        find_cast = TmbdService.find_cast(550)

        expect(find_cast).to be_a(Hash)
        expect(find_cast[:cast]).to be_an(Array)
        expect(find_cast[:cast].first[:name]).to be_a(String)
        expect(find_cast[:cast].first[:character]).to be_a(String)

      end
    end
  end
end