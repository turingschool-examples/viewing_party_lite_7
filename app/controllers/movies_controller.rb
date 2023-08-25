class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @facade = SearchFacade.new(params)
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @facade = ShowFacade.new(params)
  end
end