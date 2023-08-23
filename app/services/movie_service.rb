class MovieService

  def search_movies(title)
    get_url("3/search/movie?language=en-US&page=#{title}")
  end

  def discover_movies #logic to limit in model
    get_url("/3/discover/movie?language=en-US&page=1&sort_by=popularity.desc")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.headers["api_key"] = ENV["API_KEY_AUTH"]
    end
  end
end