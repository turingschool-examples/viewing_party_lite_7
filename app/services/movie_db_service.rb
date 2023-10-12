require "faraday"
require "json"

class MovieDbService
  BASE_URL = 'https://api.themoviedb.org/3'
  API_KEY = Rails.application.credentials.the_movie_db[:key]

  def connection
    # Faraday.new(url: BASE_URL) do |faraday|
    #   faraday.params['the_movie_db_api_key'] = API_KEY
    #   faraday.adapter Faraday.default_adapter
    # end
    Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.headers["X-API-Key"] = Rails.application.credentials.the_movie_db[:key]
    end
  end

  def movie_details(movie_id)
    response = connection.get("/3/movie/#{movie_id}")
    parse_response(response)
  end

  def movie_cast(movie_id)
    response = connection.get("/movie/#{movie_id}/credits")
    parse_response(response)["cast"].first(10)
  end

  def movie_reviews(movie_id)
    response = connection.get("/movie/#{movie_id}/reviews")
    parse_response(response)
  end

  private

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

