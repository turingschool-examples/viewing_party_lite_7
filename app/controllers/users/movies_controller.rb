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
#-----------------cast--------------------
    conn2 = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
    end

    response2 = conn2.get("/3/movie/#{@movie[:id]}/credits")
    data2 = JSON.parse(response2.body, symbolize_names: true)
    @cast = data2[:cast].take(10)
  #-----------------reviews--------------------
  conn3 = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
  end

  response3 = conn3.get("/3/movie/#{@movie[:id]}/reviews")
  data3 = JSON.parse(response3.body, symbolize_names: true)
  @reviews = data3[:results].take(10)
  @total_reviews = data[:total_results]
  #-----------------details--------------------
  conn4 = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
  end

  response4 = conn4.get("/3/movie/#{@movie[:id]}")
  @data4 = JSON.parse(response4.body, symbolize_names: true)
  end

  def search 
    
  end
end
