class MoviedbService
  
  def get_movie(id)
    fetch_api("/movie/#{id}")
  end
  
  def get_top_rated
    fetch_api("/movie/top_rated")
  end
  
  def get_cast(id)
    fetch_api("/movie/#{id}/credits")
  end

  def fetch_api(url)
    response = connection.get(url)
    JSON.parse(response.body, symoblize_names: true)
  end

  private
  def connection
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["TMDB_API_KEY"]
    end
  end

  # for V4 Bearer Token API key:
  # def connection
  #   url = "https://api.themoviedb.org/3"
  #   Faraday.new(url: url, headers: { "Authorization" => "Bearer #{ENV["MOVIEDB_API_KEY"]}" })
  # end


end