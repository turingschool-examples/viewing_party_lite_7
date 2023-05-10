class MovieService
  def conn
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def top_rated_movies
    get_url("movie/top_rated")
  end

  def movie_search(query)
    get_url("search/movie?query=#{query}")
  end
end