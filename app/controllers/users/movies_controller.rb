class Users::MoviesController < ApplicationController

  def index
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["api_key"] = ENV["MOVIES_API_KEY"]
    end
    
    response = conn.get("/3/discover/movie.json")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end
end