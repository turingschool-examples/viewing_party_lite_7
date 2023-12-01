class UserPartiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @parties = @user.user_parties
  end

  def new
    @user = User.find(params[:user_id])
    @movie_facade = DetailedMovieFacade.new(params[:movie_id])
  end
end