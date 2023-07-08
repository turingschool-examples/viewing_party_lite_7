class MoviesController < ApplicationController

  def create
  end
  
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["api_access_key"]
    end
    response = conn.get("/3/movie/popular")
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    @movies = data[:results]
  end

  def show
  end
end



