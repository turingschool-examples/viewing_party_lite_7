require 'pry'
require 'faraday'
require 'json'

def conn
  Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
    faraday.params['api_key'] = ENV['MOVIE_API_KEY']
    require 'pry'; binding.pry
  end
end

parsed = JSON.parse(conn.get('movie/top_rated').body, symbolize_names: true)