require 'faraday'
class TopMoviesService

  def self.connection
    url = "https://api.themoviedb.org"
    Faraday.new(url: url, headers: {"Authorization" => "Bearer #{ENV["movie_token"]}"})
  end

  def self.parse_api(arg)
    response = connection.get("#{arg}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_by_keyword(keywords)
    parse_api("")
  end

  def self.top_rated_movies
    parse_api("/3/movie/top_rated")
  end
end