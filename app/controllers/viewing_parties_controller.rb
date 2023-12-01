class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie(params[:movie_id])
    @invitees = @user.friends
  end

  def create
    # convert poro::movie to ar::movie
    redirect_to discover_user_path(params[:user_id])
  end
end
