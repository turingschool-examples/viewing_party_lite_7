class MoviedbService
  def fetch_api(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_top_20
    fetch_api("movie/top_rated?include_adult=false")
  end

  def get_movie_by_word(word)
    fetch_api("search/movie?query=#{word}&include_adult=false")
  end

  def get_movie(id)
    fetch_api("movie/#{id}")
  end
  
  def get_cast(id)
    fetch_api("movie/#{id}/credits")
  end

  def get_reviews(id)
    fetch_api("movie/#{id}/reviews")
  end
  
  private
  def connection
    Faraday.new(url: "https://api.themoviedb.org/3/", params: { api_key: ENV["TMDB_API_KEY"] })
  end
end