class Users::MoviesController < ApplicationController

  def index
    @user = params[:user_id]
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
    end

    response = conn.get("/3/discover/movie")
    data = JSON.parse(response.body, symbolize_names: true)
    @movies = data[:results].take(20)

    movies = data[:results]
    found_movies = movies.find_all {|m| m[:title] == params[:search]}
    @movie = found_movies.first
  end

  def show 
    @user = params[:user_id]
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
    end

    response = conn.get("/3/discover/movie")
    data = JSON.parse(response.body, symbolize_names: true)
    
    movies = data[:results]
    found_movies = movies.find_all {|m| m[:id] == params[:id].to_i}
    @movie = found_movies.first
  end

  def search 
    
  end
end
