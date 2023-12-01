class ViewingPartyController < ApplicationController
  def new
    @facade = MovieDetailsFacade.new(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    host = User.find(params[:id])
    party = Party.create!(party_params)
    PartyUser.create!(user_id: host.id, party_id: party.id, is_host: true)
    attendees = params[:invites].map do |invite|
      PartyUser.create!(user_id: invite, party_id: party.id)
    end
    redirect_to user_path(host)
  end

  private

  def party_params
    params.permit(:movie_id, :duration_of_party, :party_date, :start_time)
  end
end