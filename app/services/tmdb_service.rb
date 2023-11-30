class TMDBService
  def self.top_rated
    json_from_url("movie/top_rated")[:results]  # api call only returns first 20 index
  end

  def self.search_movies(title)
    json_from_url("search/movie?query=#{title}")[:results]  # api call only returns first 20 index
  end

  # consider running this additional api call in separate thread, kicked off by ::top_rated or ::search_movies
  def self.get_movie(id)
    json_from_url("movie/#{id}")
  end

  # consider running this additional api call in separate thread
  def self.get_cast_and_reviews_for_movie(id)
    {
      cast: json_from_url("movie/#{id}/credits")[:cast].first(10),
      reviews: json_from_url("movie/#{id}/reviews")[:results]
    }
  end

  def self.json_from_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["Authorization"] = "Bearer " + Rails.application.credentials.tmdb[:auth]
    end
  end
end
