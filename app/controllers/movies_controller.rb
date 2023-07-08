class MoviesController < ApplicationController
  def index
    @users = User.all #find specific user?
    @user = User.find(params[:user_id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    
  end
end