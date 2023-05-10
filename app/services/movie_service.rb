require 'faraday'

class MovieService
  def conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def get_top_rated_movies
    url = '/3/movie/top_rated?'
    response = conn.get(url, { api_key: ENV['API_KEY'], language: 'en-US', page: 1 })
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_movie_search(query)
    url = '/3/search/movie?'
    response = conn.get(url, { api_key: ENV['API_KEY'], language: 'en-US', query: query, page: 1 })
    JSON.parse(response.body, symbolize_names: true)
  end
end
