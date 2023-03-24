class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie_facade = MovieFacade.new(params[:movie_id])
    @users = User.all
  end

  def create
    party = Party.new(party_params)
  end

  private

  def party_params
    params[:host_id] = params[:user_id]
    params.permit(:movie_id, :duration, :day, :time, :host_id)
  end
end