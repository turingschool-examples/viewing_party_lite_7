class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    search_type = params[:search_type]

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = ENV["TMBD_API_KEY"]
    end

    response = conn.get("/3/movie/top_rated?language=en-US&with_original_language=en&page=1")

    json = JSON.parse(response.body, symbolize_names: true)
    @top_20 = json[:results].first(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end
end