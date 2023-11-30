class MoviesController < ApplicationController

  def search
    movie = params[:search]

    conn = Faraday.new("https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    if !params[:search]
      response = conn.get("/3/movie/top_rated?page=1")

      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    else 
      response = conn.get("/3/search/movie?query=#{movie}&include_adult=false&language=en-US&page=1")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
    end 
  end
end
