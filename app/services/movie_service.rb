class MovieService
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_movies
    get_url("movie/top_rated")
  end

  def self.movie_search(query)
    get_url("search/movie?query=#{query}")
  end

  def self.find_by_id(id)
    get_url("movie/#{id}")
  end

  def self.cast_by_id(id)
    get_url("movie/#{id}/credits")
  end

  def self.reviews_by_id(id)
    get_url("movie/#{id}/reviews")
  end
end
