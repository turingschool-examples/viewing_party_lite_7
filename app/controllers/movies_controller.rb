class MoviesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    if params[:search_by_movie_title]
      @movies = MovieFacade.search(params[:search_by_movie_title])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
    id = params[:id]
    @movie = MovieFacade.find_by_id(params[:id])
    @cast = MovieFacade.find_cast(params[:id])
  end
end
