class MovieService
  def self.get_movie(id)
    get_url("movie/#{id}")
  end
  
  def self.top_rated
    get_url("movie/top_rated")
  end
  
  def self.get_cast(id)
    get_url("movie/#{id}/credits")
  end
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers["X-API-KEY"] = ENV["TMDB_KEY"]
    end
  end
  
end