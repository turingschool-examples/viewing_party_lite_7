class MoviesController < ApplicationController
  def index
  end

  def search
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    if params[:q] == "top20rated"
      response = conn.get("/3/movie/top_rated")

      json = JSON.parse(response.body, symbolize_names: true)
      @movies = json[:results][0..19]
    else
      response = conn.get("3/search/movie?query=#{params[:q]}")

      json = JSON.parse(response.body, symbolize_names: true)
      @movies = json[:results][0..19]
    end
  end
  
  def show
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("3/movie/#{params[:movie_id]}")
    @movie = JSON.parse(response.body, symbolize_names: true)

    response = conn.get("3/movie/#{params[:movie_id]}/credits")
    json = JSON.parse(response.body, symbolize_names: true)
    @movie_cast = json[:cast][0..9]

    response = conn.get("3/movie/#{params[:movie_id]}/reviews")
    json = JSON.parse(response.body, symbolize_names: true)
    @movie_reviews = json[:results]
  end
end