class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MoviesFacade.new(params)
  end

  def show
    @facade = MoviesFacade.new(params)
    @user = User.find(params[:user_id])
    @cast = MovieService.new.get_movie_cast_info(params[:id])
    @reviews = MovieService.new.get_movie_review_info(params[:id])
  end

end