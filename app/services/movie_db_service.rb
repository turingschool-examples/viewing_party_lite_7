class MovieDbService
  def search_movies(query)
    response = get_url("/3/search/movie", { query: query } )
  end

  def movie_details(id)
    response = get_url("/3/movie/#{id}")
  end

  def top_movies
    response = get_url("/3/movie/top_rated")
    response[:results]
  end  

  private

  def get_url(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |req|
      req.headers['Authorization'] = "Bearer #{ENV['TMDB_V4_TOKEN']}"
      req.headers['Content-Type'] = 'application/json;charset=utf-8'
    end
  end
end
