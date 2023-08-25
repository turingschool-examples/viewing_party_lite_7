class MovieService

  def self.find_top_rated
    response = conn("top_rated").get do |faraday|
      faraday.params["api_key"] = ENV["TMDB_API_KEY"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn(endpoint_url)
    url = "https://api.themoviedb.org/3/movie/#{endpoint_url}"
    Faraday.new(url: url)
  end

  def self.find_movie(id)
    response = conn("#{id}").get do |faraday|
      faraday.params["api_key"] = ENV["TMDB_API_KEY"]
      faraday.params["append_to_response"] = "credits,reviews"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end