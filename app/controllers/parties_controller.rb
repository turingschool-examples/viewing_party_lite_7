class PartiesController < ApplicationController
  def new
    if current_user.nil?
      flash[:error] = "You must be logged in to view this page!"
      redirect_to user_movies_path(params[:user_id], params[:movie_id])
    else
      @user = current_user
      @movie_facade = MovieFacade.new(params[:movie_id])
      @users = User.all
    end
  end

  def create
    @user = current_user
    party = Party.new(party_params)
  end

  private

  def party_params
    params[:host_id] = params[:user_id]
    params.permit(:movie_id, :duration, :day, :time, :host_id)
  end
end