require 'pry'
require 'faraday'
require 'json'

def conn
  Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
    faraday.params['api_key'] = ENV['MOVIE_API_KEY']
  end
end

top = JSON.parse(conn.get('movie/top_rated').body, symbolize_names: true)[:results]
search = JSON.parse(conn.get('search/movie', { query: 'basketball' }).body, symbolize_names: true)[:results]
id = JSON.parse(conn.get("movie/550").body, symbolize_names: true)
require 'pry'; binding.pry