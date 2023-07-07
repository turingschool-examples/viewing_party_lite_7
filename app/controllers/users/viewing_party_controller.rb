class Users::ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.new(params).search
    @user = User.find(params[:user_id])
    @users = User.where.not(id: @user.id)
  end

  def create
    @party = Party.new(party_params)
  end

  private

  def party_params
    params.permit(:date, :start_time, :duration, :movie_id, :host_id)
  end

  
end