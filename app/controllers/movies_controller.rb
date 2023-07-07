class MoviesController < ApplicationController
  before_action :find_user
  before_action :find_keyword

  def index
    @facade = search_keyword? ? MovieFacade.new(params[:keyword]) : MovieFacade.new
  end

  def show
    movie_id = params[:id]

    conn = Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.params["api_key"] = ENV["TMDB_API_KEY"]
    end

    response = conn.get("movie/#{movie_id}")

    json = JSON.parse(response.body, symbolize_names: true)
    @movie = Movie.new(json)
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
