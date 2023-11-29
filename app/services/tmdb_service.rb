class TMDBService
  def self.top_rated
    get_url("movie/top_rated")[:results]
  end

  def self.get_movie(id)
    get_url("movie/#{id}")
  end

  def self.search_movies(title)
    get_url("search/movie?query=#{title}")[:results]
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["Authorization"] = "Bearer " + Rails.application.credentials.tmdb[:auth]
    end
  end
end
