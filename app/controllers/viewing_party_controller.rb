class ViewingPartyController < ApplicationController
  before_action :require_login, only: :new

  def new
    @facade = MovieDetailsFacade.new(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    host = User.find(params[:id])
    party = Party.new(party_params)
    if party.save
      host_of_party(host, party)
      attendees_of_party(party)
      redirect_to user_path(host)
    else
      redirect_to new_user_movie_viewing_party_path(host, params[:movie_id])
      flash[:error] = 'Please fill out all field, duration, time and date of the party'
    end
  end

  private

  def party_params
    params.permit(:movie_id, :duration_of_party, :party_date, :start_time)
  end

  def host_of_party(host, party)
    PartyUser.create!(user_id: host.id, party_id: party.id, is_host: true)
  end

  def attendees_of_party(party)
    unless params[:invites].nil?
      params[:invites].map do |invite|
        PartyUser.create!(user_id: invite, party_id: party.id)
      end
    end
  end

  def require_login
    unless current_user
      flash[:error] = 'You must be logged in or registered to create a movie party'
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}"
    end
  end
end