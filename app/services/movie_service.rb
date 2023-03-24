require 'faraday'

class MovieService
  def self.top_movies
    get_url("/3/movie/top_rated")
  end

  def self.search_movies(search)
    get_url("/3/search/movie?query=#{search}")
  end

  def self.movie_details(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def self.movie_cast(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end

  def self.movie_reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end

  private
  
  def self.get_url(url)
    response = conn.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
  
  
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIEDB_API_KEY"]
    end
  end
end