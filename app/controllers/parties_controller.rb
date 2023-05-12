class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new.find_movie(params[:movie_id])
    @users = User.all
  end

  def create
    require 'pry'; binding.pry
  end
end
