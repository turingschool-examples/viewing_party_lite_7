class MoviesController < ApplicationController
  before_action :find_user

  def index
    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV["TMDB_API_KEY"]
    end

    if params[:q] == "top%20rated"
      response = conn.get("movie/top_rated")
    else
      search_word = params[:q]
      response = conn.get("search/movie?query=#{search_word}")
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end

  def show; end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
