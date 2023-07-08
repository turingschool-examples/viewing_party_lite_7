class MoviesController < ApplicationController
  before_action :find_user
  before_action :find_keyword

  def index
    @facade = search_keyword? ? MovieFacade.new(params[:keyword]) : MovieFacade.new
  end

  def show
    @movie_facade = MovieFacade.new(params[:id])
    
    # ---- movie details:
    # movie_id = params[:id]

    # conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
    #   faraday.params["api_key"] = ENV["TMDB_API_KEY"]
    # end

    # response = conn.get("movie/#{movie_id}")

    # movie_details = JSON.parse(response.body, symbolize_names: true)
    # @movie = Movie.new(movie_details)

    # ---- movie credits/cast:
    # movie_id = params[:id]

    # conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
    #   faraday.params["api_key"] = ENV["TMDB_API_KEY"]
    # end

    # response = conn.get("movie/#{movie_id}/credits")
    # cast_details = JSON.parse(response.body, symbolize_names: true)
    # @cast = Credit.new(cast_details)

    # @movie_facade = MovieFacade.new(params[:id])
    # @cast = MovieFacade.top_ten_cast(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def search_keyword?
    params[:keyword].present?
  end

  def find_keyword
    @keyword = params[:keyword]
  end
end
