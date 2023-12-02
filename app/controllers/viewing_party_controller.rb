class ViewingPartyController < ApplicationController
  def new
    @facade = MovieDetailsFacade.new(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    host = User.find(params[:id])
    party = Party.new(party_params)

    if party.save
      host(host, party)
      attendees(party)
      redirect_to user_path(host)
    else
      redirect_to new_user_movie_viewing_party(host, params[:movie_id])
      flash[:error] = 'Please fill out time and date of the party'
    end
  end

  private

  def party_params
    params.permit(:movie_id, :duration_of_party, :party_date, :start_time)
  end

  def host(host, party)
    PartyUser.create(user_id: host.id, party_id: party.id, is_host: true)
    attendees(party)
  end

  def attendees(party)
    params[:invites].map do |invite|
      PartyUser.create(user_id: invite, party_id: party.id)
    end
  end
end