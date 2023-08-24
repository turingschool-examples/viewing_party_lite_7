class SearchController < ApplicationController

  def search 
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["api_key"] = ENV["MOVIES_API_KEY"]
      end
      response = conn.get("/3/discover/movie.json")
  
      data = JSON.parse(response.body, symbolize_names: true)
  
      movies = data[:results][0][:title]
    require 'pry'; binding.pry
      found_movies = movies.find_all {|m| m[:title] == params[:search]}
      @movie = found_movies.first
      render "landing_page/index"
  end
end
