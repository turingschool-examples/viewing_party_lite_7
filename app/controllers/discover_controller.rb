class DiscoverController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:keyword].present?
      @movies = MovieSearch.new.one_movie(params[:keyword])
      





      # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      #   faraday.headers["Authorization"] = ENV["api_access_key"]
      # end
      # response = conn.get("/3/search/movie?query=#{params[:keyword]}")

      # data = JSON.parse(response.body, symbolize_names: true)
      # @movies = data[:results].map do |movie|
      #   Movie.new(movie)
      # end
    else
      @movies = MovieSearch.new.all_movies(params[:keyword])
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
end