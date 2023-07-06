class MoviesController < ApplicationController
  def index
    @users = User.all #find specific user?
    @user = User.find(params[:user_id])
  end
  def show
    @movie = Movie.find(params[:id])
  end

  def discover
    conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.headers["api_key"] = ENV["MOVIE_API_KEY"]
    end
    response = conn.get("/discover/movie.json")

    data = JSON.parse(response.body, symbolize_titles: true)
  end
end