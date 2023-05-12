class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @party = Party.new
    @movie = MovieFacade.new.movie_details(params[:id])
  end
end