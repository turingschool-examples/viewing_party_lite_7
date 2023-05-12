class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:query].present?
      @movies = MovieFacade.new.search_movies(params[:query])
    else
      @movies = MovieFacade.new.top_rated_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new.movie_details(params[:id])
  end
end