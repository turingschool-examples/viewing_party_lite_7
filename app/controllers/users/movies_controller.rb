class Users::MoviesController < ApplicationController

  def discover
    @user = User.find(params[:user_id])
    @movies = Movie.all
  end

  def index
    @user = User.find(params[:user_id])

    if params[:top_movies]
      @movies = Movie.top_movies
    elsif params[:movie_title]
      @movies = Movie.search(params[:movie_title])
    end
  end

end