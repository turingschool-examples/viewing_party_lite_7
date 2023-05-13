class TvService
  def conn
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.params["api_key"] = ENV["THE_MOVIE_DB_API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def tv_details(id)
    get_url("/tv/#{id}")
  end
end