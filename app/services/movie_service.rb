class MovieService
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.header["api_key"] = ENV["api_key"]
    end
  end

  def top_movies
    get_url("movie/top_rated")
  end

  def movies_search(input)
    get_url("search/movie?language=en-US&query=#{input}&page=1&include_adult=false")
  end
end