class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_dashboard_id])
    @movie = MovieFacade.new(@user).movie_details(params[:movie_id]).movies
    @all_users = User.all
  end
end
