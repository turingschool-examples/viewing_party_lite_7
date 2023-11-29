class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:top_movies] == "top rated"
      top_20
    elsif params[:search] != nil
      
      search
    end
  end

  private

  def top_20
    conn = Faraday.new(url:"https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end
  
  def search
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
      
    end
      search_term = params[:search]

      
      response = conn.get("/3/search/movie?query=#{search_term}")
      json = JSON.parse(response.body, symbolize_names: true)
      @movies = json[:results]
  end
end