class MoviedbService

  def fetch_api(arg)
    response = connection.get(arg)
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