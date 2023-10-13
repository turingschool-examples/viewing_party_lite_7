class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = MoviesSearchFacade.new(params[:search])
  end
  
  def show
    @facade = MoviesDetailsFacade.new(params[:id])
  end
end
