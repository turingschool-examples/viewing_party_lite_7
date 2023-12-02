require 'rails_helper'

RSpec.describe MoviesSearchService do
  before(:each) do
    @movies_search = MoviesSearchService.new
  end

  describe '#top_movies' do
    it "returns a nested hash of the top rated movies' data" do
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
      expect(@movies_search.top_movies).to be_a(Hash)
      expect(@movies_search.top_movies[:results]).to be_a(Array)

      results = @movies_search.top_movies[:results]
      expect(results[0]).to be_a(Hash)
      expect(results[0][:vote_average]).to be_a(Float)
    end
  end

  describe '#search_movies' do 
    it 'returns an array movie objects relevant to the search' do
      json_response = File.read('spec/fixtures/search_data.json')
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Nightmare%20Before%20Christmas").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
      expect(@movies_search.search_movies('Nightmare Before Christmas')).to be_a(Array)
      expect(@movies_search.search_movies('Nightmare Before Christmas')[0]).to be_a(Movie)
    end
  end

  describe '#conn' do
    it 'establishes a connection with TMDB API' do
      expect(@movies_search.conn).to be_a(Faraday::Connection)
    end
  end

  describe '#get_url' do
    it 'returns a nested hash response for a valid API endpoint' do
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
      expect(@movies_search.get_url('movie/top_rated')).to be_a(Hash)
      expect(@movies_search.get_url('movie/top_rated')[:results]).to be_a(Array)
      expect(@movies_search.get_url('movie/top_rated')[:results][0]).to be_a(Hash)
    end
  end

  describe '#genre_runtime' do
    it 'returns a movie object with details' do
      json_response = File.read('spec/fixtures/genre_runtime_data.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
      expect(@movies_search.genre_runtime(238)).to be_a(Movie)
    end
  end

  describe '#movie_cast' do
    it 'returns an array of movie objects with cast details' do
      json_response = File.read('spec/fixtures/movie_cast_data.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
      expect(@movies_search.movie_cast(238)).to be_a(Array)
      expect(@movies_search.movie_cast(238)[0]).to be_a(Movie)
    end
  end

  describe '#movie_reviews' do
    it 'returns an array of movie objects with review details' do
      json_response = File.read('spec/fixtures/movie_review_data.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
      expect(@movies_search.movie_reviews(238)).to be_a(Array)
      expect(@movies_search.movie_reviews(238)[0]).to be_a(Movie)
    end
  end

  describe '#movie_review_count' do
    it 'returns a movie object with review count' do
      json_response = File.read('spec/fixtures/movie_review_data.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWY5Y2FlYmQ2ZmNlYjUzMDAyNWQ0OGYyMzFmODUzYyIsInN1YiI6IjY1NjUyMjJlNWNlYTE4MDBjNTQ4N2MxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0RdSJKPQp2j6olRbyyMsEBtsH6iKAZKMcPWseHnO_nI',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
      expect(@movies_search.movie_review_count(238)).to be_a(Movie)
    end
  end
end
