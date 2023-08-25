class MovieService
  def self.top_20_flicks
    get_url("/3/movie/top_rated")
  end

  def self.movie_search(search)
    get_url("/3/search/movie?search=#{search}")
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