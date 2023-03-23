class MoviedbService
  def top_rated_movies
    get_url("/3/movie/top_rated?q=maxResults20")
  end

  def search_results(keyword)
    get_url("/3/search/movie?query=#{keyword}&maxResults=20")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
      faraday.headers[:Authorization] = "Bearer #{ENV["MOVIEDB_API_KEY"]}"
    end
  end
end