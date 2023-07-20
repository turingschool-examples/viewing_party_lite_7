class User::DiscoverController < ApplicationController
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
    else
      @conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["Authorization"] = ENV["api_access_key"]
      end
      @response = @conn.get("/3/movie/popular")
      
      @data = JSON.parse(@response.body, symbolize_names: true)
      @movies = @data[:results].map do |movie|
        PopularMovie.new(movie)
      end
    end
  end
end