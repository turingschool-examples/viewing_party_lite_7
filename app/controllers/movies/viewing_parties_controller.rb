class Movies::ViewingPartiesController < ApplicationController
  def new
    if current_user
      @movie = MovieFacade.new.find_movie(params[:movie_id])
      @user = current_user
    else
      flash[:alert] = 'You must be logged in to create a viewing party.'
      redirect_to movie_path(params[:movie_id])
    end
  end

  def create
    host = current_user
    party = Party.new(party_params)
    if party.save
      UserParty.create(user_id: host.id, party_id: party.id)
      params[:user].each do |user_id|
        UserParty.create(user_id: user_id, party_id: party.id)
      end
      redirect_to dashboard_path
      flash[:notice] = 'Your party has been created!'
    else
      flash[:alert] = 'Please fill in all fields.'
      redirect_to new_movie_viewing_party_path(party_params[:movie_id])
    end
  end

  private
  def party_params
    params.permit(:movie_id, :host, :duration, :date, :start_time)
  end
end