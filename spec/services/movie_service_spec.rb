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
end