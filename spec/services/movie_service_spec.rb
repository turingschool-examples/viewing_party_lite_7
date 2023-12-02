require 'rails_helper'

RSpec.describe MovieService do
  context 'instance methods' do
    describe '#conn' do
      it 'establishes a Faraday connection to the API' do
        expect(MovieService.conn).to be_a(Faraday::Connection)
      end
    end
    describe '#json_from_url' do
      it 'returns parsed JSON data from given URL', :vcr do
        parsed_response = MovieService.json_from_url('https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&with_cast=true&with_genres=true&with_people=true&with_runtime=true&page=1&sort_by=popularity.desc')
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:results]).to be_an(Array)
      end
    end
    describe '#return_results(query)' do
      it 'can return a list of movies from the API, ordered by popularity', :vcr do
        discover = MovieService.discover_results
        expect(discover).to be_a(Hash)
        expect(discover[:results]).to be_an(Array)
        movie_data = discover[:results].first
        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)
        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:title]).to be_a(String)
      end
      it 'can return a list of movies from the API, searching by title', :vcr do
        searching = MovieService.search_results('barbie')
        expect(searching).to be_a(Hash)
        expect(searching[:results]).to be_an(Array)
        movie_data = searching[:results].first
        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)
        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:title]).to be_a(String)
      end
    end
  end
end
