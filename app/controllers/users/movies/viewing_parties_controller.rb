class Users::Movies::ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new(params[:movie_id]).find_movie
  end

  def create
    host = User.find(params[:user_id])
    party = Party.new(party_params)
    if party.save
      Partygoer.create(user: host, party_id: party.id, host: true)
      params[:user].each do |user_id|
        Partygoer.create(user_id: user_id, party_id: party.id, host: false)
      end
      redirect_to user_path(host)
      flash[:notice] = 'Your party has been created!'
    else
      flash[:alert] = 'Please fill in all fields.'
      redirect_to new_user_movie_viewing_party_path(host, party_params[:movie_id])
    end
  end

  private
  def party_params
    params.permit(:movie_id, :duration, :date, :start_time)
  end
end
