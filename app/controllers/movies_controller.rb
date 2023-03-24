class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MoviesFacade.new(params)
  end

  def show
    @user = User.find(params[:user_id])
    @movie =  MoviesFacade.new(params[:id])
    @movie = @movie.detailed_movie
    # require 'pry'; binding.pry
  end
end
