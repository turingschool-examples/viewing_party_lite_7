class ViewingPartiesController < ApplicationController

  def new
    @viewing_party = ViewingParty.new
    @user = User.find(params[:user_id])
    @details = MovieDetailsFacade.movie_details(params[:movie_id])
  end

  def create
    @user = User.find(params[:user_id])
    @details = MovieDetailsFacade.movie_details(params[:movie_id])

    merged_params = viewing_party_params.merge(host: @user.name, movie_title: @details.title)

    @viewing_party = ViewingParty.new(merged_params)
    if @details.runtime < @viewing_party.duration
      @viewing_party.save
      flash[:success] = "Viewing party successfully created! Now it's time to invite your friends!"
      redirect_to "/users/#{@user.id}/movies/#{@details.id}/viewing-party/new"
    else
      flash[:custom_message] = "Creation unsuccessful. Your viewing party can't take less time than the movie!"
      redirect_to "/users/#{@user.id}/movies/#{@details.id}/viewing-party/new"
    end
  end

  private

  def viewing_party_params
    params.permit(:name, :duration, :event_date, :start_time)
  end
end