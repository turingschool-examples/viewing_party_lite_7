class MovieService
  def search_movies(search)
    get_url("/3/search/movie?query=#{search}")
  end

  def top_rates_movies
    get_url("/3/movie/top_rated")
  end

  def find_movie(id)
    get_url("/3/movie/#{id}")
  end

  def find_cast(id)
    get_url("/3/movie/#{id}/credits")
  end

  def find_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params["api_key"] = ENV["MOVIE_DB_API_KEY"]
    end
  end
end