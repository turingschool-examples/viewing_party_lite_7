class MovieService

  def top_rated
    get_url("/3/movie/top_rated")
  end

  def search(keyword)
    get_url("/3/search/movie?query=#{keyword}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end
end