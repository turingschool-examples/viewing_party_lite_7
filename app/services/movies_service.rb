class MoviesService
  def top_20_rated
    get_url("/3/movie/top_rated?language=en-US&with_original_language=en&page=1&limit10")
  end

  def keyword_search(keyword)
    get_url("/3/search/movie?query=#{keyword}&page=1")
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["TMDB_API_KEY"]
    end
  end
end