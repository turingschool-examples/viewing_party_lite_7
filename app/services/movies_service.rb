require "faraday"
class MoviesService
  def self.connection
    url = "https://api.themoviedb.org"
    Faraday.new(url:, headers: { "Authorization" => "Bearer #{ENV['movie_token']}" })
  end

  def self.parse_api(arg)
    response = connection.get("#{arg}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.searched_movies(title)
    parse_api("/3/search/movie?&query=#{title}")
  end

  def self.top_rated_movies
    parse_api("/3/movie/top_rated")
  end
end
