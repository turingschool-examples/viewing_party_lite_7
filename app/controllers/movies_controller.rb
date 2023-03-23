class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = TopMovieFacade.new
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new(params[:id]).movie
  end
end