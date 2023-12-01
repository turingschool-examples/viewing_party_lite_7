class ViewingPartyController < ApplicationController
  def new
    @facade = MovieDetailsFacade.new(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    require 'pry'; binding.pry
  end
end