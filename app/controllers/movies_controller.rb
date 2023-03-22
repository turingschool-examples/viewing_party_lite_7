class MoviesController < ApplicationController
  # def search
  # end

  def index
    conn = Faraday.new(url: "https://api.themoviedb.org", headers: {"Authorization" => "Bearer #{ENV["movie_token"]}"}) do |faraday|
      # faraday.headers["api_key"] = 
      # faraday.headers["page"] = "1"
      # faraday.headers["language"] = 'en-US'
    end
    response = conn.get("/3/movie/top_rated")

    data = JSON.parse(response.body, symbolize_names: true)
  end

end