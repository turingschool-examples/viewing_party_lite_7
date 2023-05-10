class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MoviesFacade.new(params)
  end

  def show
    @facade = MoviesFacade.new(params)
    @user = User.find(params[:user_id])
  end
end