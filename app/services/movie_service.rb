class MovieService
  def conn
    Faraday.new(url: "https://www.themoviedb.org") do |faraday|
      faraday.params["X-API-Key"] = ENV["TMDB_API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_20_flicks
    get_url("/movies?q=top%20rated")
  end

  def movie_search
    get_url("/movie?q=keyword")
  end
end

