class MovieService
  def search(key_word)
    get_url("/3/search/movie?query=#{key_word}")
  end

  def top_rated
    get_url("/3/movie/top_rated")
  end

  def find_movie(movie_id)
    get_url("https://api.themoviedb.org/3/movie/#{movie_id}")
  end

  def reviews(movie_id)
    get_url("https://api.themoviedb.org/3/movie/#{movie_id}/reviews")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_DB_API_KEY"]
    end
  end
end