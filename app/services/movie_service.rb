require 'faraday'

class MovieService
  def movies(query)
    get_url("https://api.themoviedb.org/3/search/movie?language=en-US&query=#{query}&include_adult=false")
  end

  def get_url(url)
    response = Faraday.new(url: url).get do |faraday|
      faraday.headers["Authorization"] = ENV['MOVIEDB_AUTHORIZATION_TOKEN']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end