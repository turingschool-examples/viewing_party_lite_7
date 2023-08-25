class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.new(params[:movie_id], nil).movie_details
    @users = User.where.not(id: params[:user_id]).order(:name)
  end

  def create
    party = ViewingParty.new(viewing_party_params)
    #sad path
    if party.duration < params[:movie_runtime].to_i
      flash[:error] = "Error: Viewing party duration must be longer than the movie's runtime"
      redirect_to user_movie_viewing_party_new_path(params[:user_id], params[:movie_id])
    elsif party.save
      flash[:success] = "Viewing Party successfully created"
      assign_host(params[:user_id], party.id)
      assign_guests(params[:invitees], party.id)
      redirect_to user_path(params[:user_id])
    end
  end

  def assign_host(user_id, vp_id)
    ViewingPartyUser.create(user_id: user_id, viewing_party_id: vp_id, hosting?: true)
  end

  def assign_guests(invitees, vp_id)
    invitees[1..].map do |user_id|
      ViewingPartyUser.create(user_id: user_id, viewing_party_id: vp_id, hosting?: false)
    end
  end


  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :date, :start_time, :movie_title, :movie_poster_path)
  end
end
