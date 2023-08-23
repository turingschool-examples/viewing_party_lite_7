class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    tmdb_service = TmdbService.new
    @movies = if params[:q] == "top rated"
      tmdb_service.top_rated_movies
    else
      tmdb_service.search_movies(params[:q])
    end
  end
end