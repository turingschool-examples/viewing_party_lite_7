class MovieService
  def self.top_20_flicks
    get_url("/3/movie/top_rated")
  end

  def self.movie_search(query)
    get_url("/3/search/movie?query=#{query}")
  end

  def self.movies_by_id(id)
    get_url("/3/movie/#{id}")
  end

  def self.movie_cast(id)
    get_url("/3/movie/#{id}/credits")
  end

  def self.movie_review(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["TMDB_API_KEY"]
    end
  end
end