class MovieService
  def movie_by_id(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def top_rated_movies
    get_url("movie/top_rated")
  end

  def movie_search(query)
    get_url("search/movie?query=#{query}")
  end

  def movie_cast(movie_id)
    get_url("movie/#{movie_id}/credits")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end
end
