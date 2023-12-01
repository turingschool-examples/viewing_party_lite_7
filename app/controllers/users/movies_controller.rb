class Users::MoviesController < ApplicationController

  def discover
    @user = User.find(params[:user_id])
    @movies = Movie.all
  end

  def index
    @user = User.find(params[:user_id])

    if params[:top_movies]
      @movies = MovieFacade.top_movies
    elsif params[:movie_title]
      @movies = MovieFacade.search(params[:movie_title])
    end
  end

  def show
    @movie = MovieFacade.new(params[:movie_id]).movie
    @user = User.find(params[:user_id])
  end

end