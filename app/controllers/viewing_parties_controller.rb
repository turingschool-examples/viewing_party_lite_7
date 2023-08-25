class ViewingPartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    facade = ViewingPartyFacade.new(params)
    @movie = facade.movie
    @viewing_party = ViewingParty.new
    @viewing_party.users.build
  end

  def create(new_viewing_party_params)
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.new(new_viewing_party_params)
    if (@viewing_party.duration >= @movie.runtime) && @viewing_party.save
      redirect_to user_path(@user)
    else
      render :new
      flash[:notice] = "Please complete all fields."
    end
  end

  private

  def new_viewing_party_params
    params.require(:viewing_party).permit(:date, :movie_id, :user_id, :duration, :start_time, viewing_party_users_ids: [:user_id, :movie_id])
  end

  def user_viewing_party_params
    
  end
end