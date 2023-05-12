class ViewingPartiesController < ApplicationController
  def new
    user = User.find(params[:user_dashboard_id])
    @facade = MovieFacade.new(user: user, type: :details, movie_id: params[:movie_id])
    @all_users = User.all
  end

  def create
    user = User.find(params[:user_dashboard_id])
    facade = MovieFacade.new(user: user, type: :details, movie_id: params[:movie_id])
    viewing_party = ViewingParty.new(viewing_party_params)
    if viewing_party.save
      UserViewingParty.create(user_id: user.user_dashboard_id, viewing_party_id: viewing_party.id)
      redirect_to user_dashboard_path(user)
    else
      flash[:error] = 'Please fill in all fields'
      redirect_to new_user_dashboard_movie_viewing_party_path(user, facade.movies.id)
    end
  end

  private
    def viewing_party_params
      params.permit(:movie_id, :created_at, :start_time, :duration)
    end
end
