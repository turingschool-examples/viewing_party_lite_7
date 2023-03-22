class MovieService

  # def movies_by_title(keyword)
  #   get_url("search/movie?api_key=#{api_key}&query=#{keyword}&page=1")
  # end
  
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["api_key"]
    end
  end

  def self.top_movies
    get_url("/3/movie/top_rated")
  end
  
  def self.movies_search(query)
    get_url("/3/search/movie?query=#{query}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end