require './services/movies_search'

RSpec.describe MoviesSearch do
  before(:each) do
    @movies_search = MoviesSearch.new
  end

  describe '#top_movies' do
    it 'returns an array movie objects which are the top rated movies' do
      expect(@movies_search.top_movies).to be_a(Array)
      expect(@movies_search.top_movies[0]).to be_a(Movie)
    end
  end

  describe '#search_movies' do 
    it 'returns an array movie objects relevant to the search' do
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
      expect(@movies_search.get_url('movie/top_rated')).to be_a(Hash)
      expect(@movies_search.get_url('movie/top_rated')[:results]).to be_a(Array)
      expect(@movies_search.get_url('movie/top_rated')[:results][0]).to be_a(Hash)
    end
  end
end
