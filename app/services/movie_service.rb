class MovieService
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.params["Authorization"] = ENV["api_access_key"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_movies
    get_url("/3/movies")
  end

  def popular_movies
    get_url("/3/movies/popular")
  end

  def one_movie(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def movie_search(movie)
    get_url("/3/search/movie?query=#{movie}")
  end

  def movie_cast(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end

  def movie_reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end
end