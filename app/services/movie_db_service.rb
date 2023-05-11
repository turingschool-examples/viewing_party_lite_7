class MovieDbService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |req|
      req.headers['Authorization'] = "Bearer #{ENV['TMDB_V4_TOKEN']}"
      req.headers['Content-Type'] = 'application/json;charset=utf-8'
    end
  end

  def self.search_movies(query)
    response = conn.get("/3/search/movie") do |req|
      req.params['query'] = query
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_details(id)
    response = conn.get("/3/movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_movies
    response = conn.get("/3/movie/top_rated")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end  
end
