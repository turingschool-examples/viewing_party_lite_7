class Users::Movies::ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = ThemoviedbService.new.movie_details(params[:movie_id])
    @users = User.excluding(@user)
  end

  def create
  end
end