class UserMoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @top_movies = MovieService.top_rated_movies
  end
end