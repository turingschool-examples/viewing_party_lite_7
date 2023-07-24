class User::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:keyword].present?
      @movies = MovieSearch.new.movie_search(params[:keyword])
      # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      #   faraday.headers["Authorization"] = ENV["api_access_key"]
      # end
      # response = conn.get("/3/search/movie?query=#{params[:keyword]}")

      # data = JSON.parse(response.body, symbolize_names: true)
      # @movies = data[:results].map do |movie|
      #   Movie.new(movie)
      end
    else
      @movies = MovieSearch.new.popular_movies
      # @conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      #   faraday.headers["Authorization"] = ENV["api_access_key"]
      # end
      # @response = @conn.get("/3/movie/popular")
      
      # @data = JSON.parse(@response.body, symbolize_names: true)
      # @movies = @data[:results].map do |movie|
      #   Movie.new(movie)
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
    @movie = Movie.new(data)
  end
end
