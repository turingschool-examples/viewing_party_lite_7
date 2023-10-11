class ThemoviedbService

  def movie_titles(title)
    response = connection.get("/3/search/movie?query=#{title}&api_key=#{Rails.application.credentials.config.first.last[:api_key]}")
    parsed = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def top_movies
    response = connection.get("/3/movie/top_rated?api_key=#{Rails.application.credentials.config.first.last[:api_key]}")
    parsed = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def connection
    conn = Faraday.new(url:'https://api.themoviedb.org')    
  end
end