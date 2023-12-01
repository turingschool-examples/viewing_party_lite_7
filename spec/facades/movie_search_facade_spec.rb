require 'rails_helper'

RSpec.describe MovieSearchFacade, type: :facade do
  describe 'movie search facade' do
    before(:each) do
      @facade = MovieSearchFacade.new  
    end

    it 'exists' do
      expect(@facade).to be_a(MovieSearchFacade)
    end

    it '#top_rated_movies' do
      json_response = File.read('spec/fixtures/top_rated_movies_data.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
            'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response, headers: {})
      expect(@facade.top_rated_movies).to be_a(Array)
      @facade.top_rated_movies.each do |movie|
        expect(movie).to be_a(Movie)
        expect(movie).to respond_to(:movie_id)
        expect(movie).to respond_to(:summary)
        expect(movie).to respond_to(:title)
        expect(movie).to respond_to(:vote_avg)
      end
    end
  end
end