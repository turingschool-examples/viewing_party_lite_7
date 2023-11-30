class UserPartiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @parties = @user.user_parties
  end

  def new
    @user = User.find(params[:user_id])
    @movie = MovieService.get_detailed_movie(params[:movie_id])
  end
end