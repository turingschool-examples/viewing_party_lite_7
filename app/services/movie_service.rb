require 'faraday'
require 'figaro'

class MovieService
  def search(key_word)
    get_url("/search/movie?query=#{key_word}")
  end

  def top_rated
    get_url("/movie/top_rated")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.headers["api_key"] = ENV["moviedb_api_key"]
    end
  end
end

require 'pry'; binding.pry