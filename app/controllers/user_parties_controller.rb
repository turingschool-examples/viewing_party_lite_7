class UserPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.new.find_movie(params[:movie_id])
  end
end