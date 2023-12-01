class ViewingPartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:id])
    @movie_runtime = params[:movie_runtime]
    @movie_title = params[:movie_title]
    @movie_id = params[:movie_id]
  end

  def create
    @viewing_party = ViewingParty.new(viewing_party_params)
    @user = User.find(params[:id])

    if @viewing_party.save
      redirect_to user_dashboard_path(@user.id)
    else
      render :new
    end
  end

  private

  def viewing_party_params
    params.require(:viewing_party).permit(:movie_id, :party_duration, :movie_title, :start_time, :id)
  end
end
