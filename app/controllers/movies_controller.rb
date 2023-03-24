class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = TopMovieFacade.new
  end

  def show
    @user = User.find(params[:user_id])
    facade = MovieFacade.new(params[:id])
    @movie = facade.movie
    @cast = facade.cast
  end
end
