class ViewingPartiesController < ApplicationController
  def new
    if current_user
      @facade = MovieFacade.new(params)
    else
      redirect_to user_movie_path(params[:user_id], params[:movie_id])
      flash[:error] = "You must be logged in to create a viewing party."
    end
  end

  def create
    user = User.find(params[:user_id])
    viewing_party = ViewingParty.create(viewing_party_params)
    viewing_party.users = User.where(id: params[:viewing_party][:user_ids])
    UserViewingParty.create(user_id: user.id, viewing_party_id: viewing_party.id, host: true)
    redirect_to user_path(user)
  end

  private

  def viewing_party_params
    params.require(:viewing_party).permit(:duration, :date, :time, :movie_id, :movie_title)
  end
end
