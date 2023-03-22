class MovieService 
  def top_rated_call 
    get_url("/3/movie/top_rated")
  end

  def search_call(query)
    get_url("/3/search/movie", {query: query})
  end

  def details_call(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def reviews_call(movie_id) 
    get_url("/3/movie/#{movie_id}/reviews")
  end

  def credits_call(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end

  def conn 
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params[:api_key] = ENV["MOVIE_DATABASE_KEY"]
    end
  end

  def get_url(url, query = nil)
    response = conn.get(url, query)
    JSON.parse(response.body, symbolize_names: true)
  end
end