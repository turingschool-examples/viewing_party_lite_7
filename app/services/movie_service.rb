require 'faraday'

class MovieService
  def conn 
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIEDB_API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_rated_movies
    get_url("/3/movie/top_rated?language=en-US&page=1")
  end

  def search_movies(query)
    get_url("/3/search/movie?query=#{query}&include_adult=false&language=en-US&page=1")
  end

  def search_movies_by_id(movie_id)
    get_url("/3/movie/#{movie_id}?language=en-US")
  end

  def find_cast(movie_id)
    get_url("/3/movie/#{movie_id}/credits?language=en-US")
  end
end
