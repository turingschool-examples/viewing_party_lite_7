class MovieService
  def self.top_rated_movies
    JSON.parse(conn.get("movie/top_rated").body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(
      url: 'https://api.themoviedb.org/3/',
      params: { api_key: ENV['MOVIE_DB_KEY'] }
    )
  end
end
