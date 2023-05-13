class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @facade = MoviesFacade.new(params[:query])
  end  

  def show
    @user = User.find(params[:id])
    @movie = MovieFacade.new(params[:movie_id])
  end
end
