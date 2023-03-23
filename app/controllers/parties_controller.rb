class PartiesController < ApplicationController
  def new 
    @movie = MoviesFacade.new.get_all_movie_info(params[:movie_id])
    @user = User.find(params[:user_id])
    @all_users = User.all
  end
end
