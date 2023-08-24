class MovieService

  def conn
    Faraday.new(url: "https://www.themoviedb.org") do |faraday|
      faraday.params["X-API-Key"] = ENV["TMDB_API_KEY"]
    end
  end

  def top_20_flicks
    response = conn.get("/movies?q=top%20rated")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def movie_search
    response = conn.get("/movie?q=keyword")

    json = JSON.parse(response.body, symbolize_names: true)
  end
  require 'pry'; binding.pry
end

