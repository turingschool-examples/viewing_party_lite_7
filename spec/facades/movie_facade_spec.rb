require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'Top movies creation' do
    it 'returns an array of the top movies in movie objects' do
      VCR.use_cassette('TmbdService/Establish_connection/can_retreive_a_list_of_the_top_20_movies') do

        top_movies = MovieFacade.top_rated_movies
        expect(top_movies).to be_an(Array)
        expect(top_movies.first).to be_a(Movie)
        expect(top_movies.count).to eq(20)
      end
    end
  end
end