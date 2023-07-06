class MoviesController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
