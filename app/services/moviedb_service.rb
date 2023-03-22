class MoviedbService

  def self.fetch_api(arg)
    response = connection.get(arg)
    JSON.parse(response.body, symoblize_names: true)
  end

  def self.connection
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["TMDB_API_KEY"]
    end
  end

  # def self.connection
  #   url = "https://api.themoviedb.org/3"
  #   Faraday.new(url: url, headers: { "Authorization" => ENV["MOVIEDB_API_KEY"] })
  # end


end