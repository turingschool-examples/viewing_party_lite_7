require "faraday"
require "json"

class MovieDbService

  def conn
    Faraday.new(url: 'https://api.themoviedb.org' ) do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.the_movie_db[:key]
    end
  end

  def movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_response(response)
  end

  def movie_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    parse_response(response)
  end

  def movie_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse_response(response)
  end

  private

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  rescue JSON::ParserError
    {}
  end
  
end

