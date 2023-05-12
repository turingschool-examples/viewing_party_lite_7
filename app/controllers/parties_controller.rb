class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = User.find(params[:movie_id])
  end
end
