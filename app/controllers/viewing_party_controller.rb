class ViewingPartyController < ApplicationController
  def new
    @facade = MovieDetailsFacade.new(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    user = User.find(params[:id])
    redirect_to user_path(user)
  end
end