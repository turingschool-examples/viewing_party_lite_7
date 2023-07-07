class MovieService
  def movies_by_id(movie)
    get_url("/3/discover/movie.json")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end
end