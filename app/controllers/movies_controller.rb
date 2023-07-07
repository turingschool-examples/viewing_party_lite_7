class MoviesController < ApplicationController
  def index
    @users = User.all #find specific user?
    @user = User.find(params[:user_id])
  end

  def show
    @movie = SearchFacade.new(params[:movie_id])
  end
end