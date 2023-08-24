class UserMoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @top_twenty_movies = MovieFacade.get_top_rated_movies
  end
end