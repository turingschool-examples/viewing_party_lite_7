class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.new(params[:movie_id], nil).movie_details
  end

  def create
    
  end
end
