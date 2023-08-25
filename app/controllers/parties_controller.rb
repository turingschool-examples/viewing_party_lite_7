class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.new.find_movie(params[:movie_id])
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @party = Party.new(party_params)
    @movie = MovieFacade.new.find_movie(params[:movie_id])
    if @party.save
      UserParty.create(user_id: @user.id, party_id: @party.id, host: true)
      params[:user].each do |user_id|
        UserParty.create(user_id: user_id, party_id: @party.id, host: false)
      end
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  private
  
  def party_params
    params.permit(:movie_id, :duration, :date, :start_time, :movie_title)
  end
end