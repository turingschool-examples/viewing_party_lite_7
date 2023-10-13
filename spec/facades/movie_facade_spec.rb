require 'rails_helper'

RSpec.describe MovieFacade do
  before :each do
    @facade = MovieFacade.new(238)
  end
  context 'class methods' do
    context '#top_20_movies' do
      it 'returns 20 movie objects' do
        VCR.use_cassette('top_20_rated_movies') do
          expect(@facade.top_20_movies).to be_an(Array)
          expect(@facade.top_20_movies.first).to be_a(Movie)
          expect(@facade.top_20_movies.count).to eq(20)
        end
      end
    end

    context '#searched_movies' do
      it 'returns 20 movie objects' do
        VCR.use_cassette('barbie_movie_search') do
          expect(@facade.searched_movies('barbie')).to be_an(Array)
          expect(@facade.searched_movies('barbie').first).to be_a(Movie)
          expect(@facade.searched_movies('barbie').count).to eq(20)
        end
      end
    end
  end
end
