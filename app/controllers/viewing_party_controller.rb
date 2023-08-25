class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MoviesService.new.find_movie(params[:movie_id])
  end

  def create
    party = ViewingParty.new(
      duration: params[:duration],
      party_date: params[:start_date],
      start_time: params[:start_time],
      movie_id: params[:movie_id]
    )
    if party.save
      party.send_invites(party, params)
      flash[:success] = 'Party Created Successfully'
      redirect_to user_path(params[:user_id])
    else
      redirect_to new_user_movie_viewing_party_path(params[:user_id], params[:movie_id])
      # flash alert?
    end
  end
end