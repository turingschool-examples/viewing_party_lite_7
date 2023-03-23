class MoviesService

  def top_rated_movies
    get_url("movie/top_rated")
  end

  def search_movies(search_query) 
    get_url("search/movie?query=#{search_query}")
  end

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.themoviedb.org/3/") do |f|
      f.params["api_key"] = ENV['MoviesDB_API_KEY']
      f.params["language"] = 'en-US'
    end
  end
end