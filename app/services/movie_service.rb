class MovieService
  def search_movies(search)
    get_url("3/search/movie?query=#{search}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.headers["api_key"] = ENV["MOVIE_DB_API_KEY"]
    end
  end
end