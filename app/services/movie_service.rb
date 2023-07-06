class MovieService
  def search(key_word)
    get_url("/3/search/movie?query=#{key_word}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_DB_API_KEY"]
    end
  end
end