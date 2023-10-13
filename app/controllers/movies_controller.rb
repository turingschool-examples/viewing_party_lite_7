class MoviesController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @facade = MoviesSearchFacade.new(params[:search])
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MoviesDetailsFacade.new(params[:search])
  end
end