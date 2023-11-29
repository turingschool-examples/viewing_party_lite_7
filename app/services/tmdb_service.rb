class TMDBService
  def top_rated
    get_url("?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=500")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org/3/discover/movie") do |faraday|
      faraday.headers["Authorization"] = "Bearer " + Rails.application.credentials.tmdb[:auth]
    end
  end
end
