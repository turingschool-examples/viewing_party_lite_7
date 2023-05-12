class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:query].present?
      @movies = MoviesFacade.new.search_movies(params[:query])
    else
      @movies = MoviesFacade.new.top_rated_movies
    end
  end

  def show
    @movie = MoviesFacade.new.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
  end
end