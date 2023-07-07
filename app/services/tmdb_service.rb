class TmdbService
  def top_movies_url
    get_url("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=#{Figaro.env.TMDB_API_KEY}")
  end

  def search_url(search)
    get_url("https://api.themoviedb.org/3/search/movie?query=#{search}&include_adult=true&language=en-US&page=1&api_key=#{Figaro.env.TMDB_API_KEY}")
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
