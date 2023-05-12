class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @party = Party.new
    @movie = MoviesFacade.new.movie_details(params[:movie_id])
  end
end