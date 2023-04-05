class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = TopMovieFacade.new
  end

  def show
    # @user = User.find(params[:user_id])
    @movie_facade = MovieFacade.new(params[:id])
  end
end
