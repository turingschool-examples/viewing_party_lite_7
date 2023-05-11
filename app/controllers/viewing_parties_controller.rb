class ViewingPartiesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @all_other_users = @user.other_users
    @party = ViewingParty.new
  end

  def create
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.create(viewing_party_params)
    @viewing_party.save
    @invited = User.where(id: params[:viewing_party][:users])
    @viewing_party.users = @invited
    ViewingPartyUser.create(user_id: @user.id, viewing_party_id: @viewing_party.id, host: true)
    redirect_to user_path(@user)
  end

  private
  
  def viewing_party_params
    params.require(:viewing_party).permit(:duration, :date, :time, :movie_id)
  end
end