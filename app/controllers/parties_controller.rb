class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new.find_movie(params[:movie_id])
    # require 'pry'; binding.pry
    @users = User.all
  end

  def create

  end
end
