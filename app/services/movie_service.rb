class MovieService
  def movie_by_id(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def all_movies
    get_url("/3/movie")
  end

  def popular_movies
    get_url("/3/movie/top_rated")
  end

  def search_movie_by_keyword(keyword)
    get_url("/3/search/movie?&query=#{keyword}")
  end

  def movie_cast(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
   
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["MOVIE_API_KEY"]
    end
  end

end