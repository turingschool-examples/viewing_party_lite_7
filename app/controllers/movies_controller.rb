class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:title])
  end

  def show
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:id])
  end
end