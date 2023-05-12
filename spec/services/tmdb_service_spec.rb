require 'rails_helper'

describe 'TmdbService', :vcr do
  context "class methods" do 
    context 'top_rated_movies' do
      it 'returns the top 20 rated movies' do
        @tmdb_service = TmdbService.new.top_rated_movies
        expect(@tmdb_service[:results]).to be_an(Array)
        expect(@tmdb_service[:results].count).to eq(20)
        top_movie = @tmdb_service[:results].first

        expect(top_movie).to have_key :id
        expect(top_movie[:id]).to be_a(Integer)

        expect(top_movie).to have_key :title
        expect(top_movie[:title]).to be_a(String)

        expect(top_movie).to have_key :vote_average
        expect(top_movie[:vote_average]).to be_a(Float)
      end
    end

    context 'search_by_title' do
      it 'returns movies that match the search term' do
        @tmdb_service = TmdbService.new.search_by_title('ocean')
        expect(@tmdb_service[:results]).to be_an(Array)
        first_result = @tmdb_service[:results].first

        expect(first_result).to have_key :id
        expect(first_result[:id]).to be_a(Integer)

        expect(first_result).to have_key(:title)
        expect(first_result[:title]).to be_a(String)

        expect(first_result).to have_key :vote_average
        expect(first_result[:vote_average]).to be_a(Float)
      end

      it 'returns an empty array if no movies match the search term' do
        @tmdb_service = TmdbService.new.search_by_title('')
        expect(@tmdb_service[:results]).to be_an(Array)
        expect(@tmdb_service[:results]).to eq([])
      end
    end

    context 'get_movie' do 
      it 'returns a movie that matches given id' do
        @tmdb_service = TmdbService.new.get_movie('5')

        expect(@tmdb_service).to have_key :id
        expect(@tmdb_service[:id]).to be_a(Integer)

        expect(@tmdb_service).to have_key(:title)
        expect(@tmdb_service[:title]).to be_a(String)

        expect(@tmdb_service).to have_key :vote_average
        expect(@tmdb_service[:vote_average]).to be_a(Float)
      end
    end
  end
end