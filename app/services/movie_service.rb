require 'faraday'

# interacts with MovieDB API
class MovieService
  def movies(query)
    get_url("https://api.themoviedb.org/3/search/movie?language=en-US&query=#{query}")
  end

  def top_movies
    get_url("https://api.themoviedb.org/3/movie/top_rated?language=en-US")
  end

  def find_movie(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}?language=en-US")
  end

  def credits(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}/credits?language=en-US")
  end

  def reviews(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}/reviews?language=en-US")
  end

  def get_url(url)
    response = Faraday.new(url:).get do |faraday|
      faraday.headers["Authorization"] = ENV['MOVIEDB_AUTHORIZATION_TOKEN']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
