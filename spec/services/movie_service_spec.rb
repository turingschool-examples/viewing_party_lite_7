require 'rails_helper'

describe MovieService do
  context 'class methods' do
    context '#get_top_20_movies' do
      it 'returns top movies data' do
        VCR.use_cassette('top_movies') do
          search = MovieService.new.get_top_movies

          expect(search).to be_a Hash
          expect(search[:results]).to be_an Array
          movie_data = search[:results].first

          expect(movie_data).to have_key :id
          expect(movie_data[:id]).to be_a(Integer)

          expect(movie_data).to have_key :title
          expect(movie_data[:title]).to be_a(String)

          expect(movie_data).to have_key :vote_average
          expect(movie_data[:vote_average]).to be_a(Float)
        end
      end
    end

    context '#get_searched_movies' do
      it 'returns searched movies data' do
        VCR.use_cassette('barbie_movie_search') do
          search = MovieService.new.get_searched_movies('barbie')

          expect(search).to be_a Hash
          expect(search[:results]).to be_an Array
          movie_data = search[:results].first

          expect(movie_data).to have_key :id
          expect(movie_data[:id]).to be_a(Integer)

          expect(movie_data).to have_key :title
          expect(movie_data[:title]).to be_a(String)

          expect(movie_data).to have_key :vote_average
          expect(movie_data[:vote_average]).to be_a(Float)
        end
      end
    end
  end
end
