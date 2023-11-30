class MoviesController < ApplicationController
  def index
    if params[:q] == "top-rated"
      @user = User.find(params[:id])

      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["authorization"] = Rails.application.credentials.TMDB[:authorization]
      end

      response = conn.get("/3/movie/top_rated")

      json = JSON.parse(response.body, symbolize_names: true)

      @movies = json[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    else
    end

    if params[:search].present?
      @user = User.find(params[:id])

      search_term = params[:search] 

      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["authorization"] = Rails.application.credentials.TMDB[:authorization]
      end

      response = conn.get("/3/search/movie?query=#{search_term}")

      json = JSON.parse(response.body, symbolize_names: true)

      @movies = json[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    end
  end
end
