class MovieService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_movies
    get_url("https://api.themoviedb.org/3/movie/top_rated")
  end

  def self.movie_search(query)
    get_url("https://api.themoviedb.org/3/search/movie?query=#{query}")
  end

  def self.find_by_id(id)
    get_url("https://api.themoviedb.org/3/movie/#{id}")
  end

  def self.reviews(movie_id)
    get_url("https://api.themoviedb.org/3/movie/#{movie_id}/reviews")
  end

  def self.cast(movie_id)
    get_url("https://api.themoviedb.org/3/movie/#{movie_id}/credits")
  end
end