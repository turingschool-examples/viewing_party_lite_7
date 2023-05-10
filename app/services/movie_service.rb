class MovieService
  def search(key_word)
    get_url("/3/search/movie?query=#{key_word}")
  end

  def top_rated
    get_url("/3/movie/top_rated")
  end

  private
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['moviedb_api_key']
      faraday.params["language"] = "en-US"
    end
  end
end