class ViewingPartiesController < ApplicationController 
  def new
    @user = User.find_by_id(session[:user_id])
    @users = User.all
    id = params[:id]
    @movie = MovieFacade.find_by_id(params[:id])
  end

  def create

  end
end