class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_rated_movies
    @user = User.find(session[:user_id])
  end

  def show
    @movie = MovieFacade.find(params[:id])
  end
end
