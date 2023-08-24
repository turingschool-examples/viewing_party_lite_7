class Users::Movies::PartiesController < ApplicationController
  def new
    @user = params[:user_id]
    @movie = params[:movie_id]
  end
end
