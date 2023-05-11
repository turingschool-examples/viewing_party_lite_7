require "rails_helper"

RSpec.describe MovieService, :vcr do
  before(:all) do
    @movie_service = MovieService.new
  end

  describe 'top_rated' do
    it 'returns the top 20 rated movies' do
      expect(@movie_service.top_rated[:results]).to be_an(Array)
      expect(@movie_service.top_rated[:results].count).to eq(20)
    end
  end

  describe 'search' do
    it 'returns search results by movie title' do
      princess_movies = @movie_service.search('Princess')[:results]

      expect(princess_movies).to be_an(Array)
      expect(princess_movies.count).to eq(20)

      princess_movies.each do |movie|
        expect(movie[:title].downcase).to include('princess')
      end
    end
  end

  describe 'find_movie' do
    it 'returns a movie by id' do
      fight_club = @movie_service.find_movie(550)

      expect(fight_club).to be_a(Hash)

      expect(fight_club).to have_key :id
      expect(fight_club[:id]).to eq(550)

      expect(fight_club).to have_key :title
      expect(fight_club[:title]).to be_a String

      expect(fight_club).to have_key :vote_average
      expect(fight_club[:vote_average]).to be_a Float

      expect(fight_club).to have_key :poster_path
      expect(fight_club[:poster_path]).to be_a String

      expect(fight_club).to have_key :genres
      expect(fight_club[:genres]).to be_an Array

      expect(fight_club).to have_key :runtime
      expect(fight_club[:runtime]).to be_an Integer

      expect(fight_club).to have_key :overview
      expect(fight_club[:overview]).to be_a String
    end
  end
end
