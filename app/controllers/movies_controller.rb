class MoviesController < ApplicationController
  # def top_movies
  #   conn = Faraday.new("https://api.themoviedb.org") do |faraday|
  #     faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
  #   end
  #   response = conn.get("/3/movie/top_rated?page=1")

  #   data = JSON.parse(response.body)
  #   # require 'pry';binding.pry
  # end

  # def search
  #   movie = params[:search]
  #   conn = Faraday.new("https://api.themoviedb.org") do |faraday|
  #     faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
  #   end
  #   response = conn.get("/3/search/movie?query=#{movie}&include_adult=false&language=en-US&page=1")
  #   data = JSON.parse(response.body)
  #   # require 'pry';binding.pry
  # end
end
