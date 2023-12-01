class ViewingPartyController < ApplicationController
  def new
    @facade = MovieDetailsFacade.new(params[:id])
    @user = User.find(params[:user_id])
    @users = User.all
  end
end