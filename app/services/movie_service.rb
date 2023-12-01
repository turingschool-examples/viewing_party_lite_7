class MovieService
  def conn
    Faraday.new("https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: :true)
  end
  
  def popular_movies
   get_url("movie/popular")
  end

  def search_movies(search_params)
    get_url("search/movie?query=#{search_params}")
  end

  def detailed_movie(movie_id)
    get_url("movie/#{movie_id}")   
  end

  def movie_cast(id)
    get_url("movie/#{id}/credits")   
  end

  def movie_reviews(movie_id)
    get_url("movie/#{movie_id}/reviews")  
  end
end