class Users::MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @movies = Movie.all
    if params[:top_movies]
      @movies = Movie.top_movies
    end
  end

end