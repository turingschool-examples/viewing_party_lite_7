class MoviesController < ApplicationController

  def create
  end
  
  def index
    @user = User.find(params[:user_id])

    if params[:keyword].present?
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["Authorization"] = ENV["api_access_key"]
      end
      response = conn.get("/3/search/movie?query=#{params[:keyword]}")

      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results].map do |movie|
        PopularMovie.new(movie)
      end
      # movie_count = 0
      # @movies = until movie_count = 2
      #   @movie_limit = data[:results].map do |movie|
      #     movie_count += 1
      #     PopularMovie.new(movie)
      #   end
    else
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["Authorization"] = ENV["api_access_key"]
      end
      response = conn.get("/3/movie/popular")
      
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results].map do |movie|
        PopularMovie.new(movie)
      end
      # movie_count = 0
      # while movie_count < 20
      #   @movies = data[:results].map do |movie|
      #     PopularMovie.new(movie)
      #     movie_count =+ 1
      #   end
      # end
    end
  end

  def show
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["api_access_key"]
    end
    response = conn.get("/3/search/movie/#{params[:id]}")

    data = JSON.parse(response.body, symbolize_names: true)
    @movies = data[:results].map do |movie|
      PopularMovie.new(movie)
    end
    require 'pry'; binding.pry
  end
end



