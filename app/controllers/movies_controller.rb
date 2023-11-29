class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    # response = conn.get("3/movie/top_rated.json")
    response = conn.get("/3/search/movie?query=#{params[:query]}")

    data = JSON.parse(response.body, symbolize_name: true)

    @movies = data["results"]
    @user = User.find(params[:user_id])
  end
end