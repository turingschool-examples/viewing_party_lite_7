class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all

    @movie = MovieFacade.new(params[:movie_id]).get_movie_details
    
  end

  def create 
    user = User.find(params[:user_id])
    movie = params[:movie_id]
  end  
end