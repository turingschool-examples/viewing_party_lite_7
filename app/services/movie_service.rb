class MovieService
  def movie_by_id(movie_id)
    get_url("/3/movie/#{movie_id}")
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-API-Key"] = ENV["MOVIE_API_KEY"]
    end
  end

end