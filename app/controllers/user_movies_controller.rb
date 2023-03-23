class UserMoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @top_movies = MovieFacade.top_rated
  end
end