class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = facade.find_movie(params[:movie_id])
  end

  def create
    party = ViewingParty.new(party_params)
    if party.save
      party.send_invites(params[:user_id], guest_hash)
      redirect_to user_path(params[:user_id])
      flash[:success] = 'Party Created Successfully'
    else
      redirect_to new_user_movie_viewing_party_path(params[:user_id], params[:movie_id])
      flash[:alert] = "Error: #{party.errors.full_messages.to_sentence}"
    end
  end

  private
  def party_params
    params.permit(:duration, :party_date, :start_time, :movie_id)
  end

  def guest_hash
    params[:guests].permit!.to_h
  end

  def facade
    @_facade ||= MoviesFacade.new
  end
end