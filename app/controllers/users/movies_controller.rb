class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search]
      @movies = MovieBuilder.search_movies(params[:search])
    else
      @movies = MovieBuilder.top_rated_movies
    end
  end
end