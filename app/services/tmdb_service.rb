class TmdbService
  def self.top_rated_movies
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_movies(query)
    response = conn.get("/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&query=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end