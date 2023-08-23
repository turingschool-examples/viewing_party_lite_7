class TmdbService
  def discover_movies
    require 'pry'; binding.pry
    get_url("/3/discover/movie")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["api_key"] = ENV["TMDB_API_KEY"]
    end
  end
end