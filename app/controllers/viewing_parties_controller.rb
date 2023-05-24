class ViewingPartiesController < ApplicationController
  before_action :user, only: [:new, :create]
  def new
    @facade = MovieFacade.new(user: user, type: :details, movie_id: params[:id])
    if current_user
      @all_users = User.all
    else
      flash[:error] = 'Please log in to create a viewing party'
      redirect_to "/movies/#{@facade.movies.id}"
    end
  end

  def create
    facade = MovieFacade.new(user: user, type: :details, movie_id: params[:id])
    viewing_party = ViewingParty.new(viewing_party_params)
    # require 'pry'; binding.pry
    if viewing_party.save
      UserViewingParty.create(user_id: user.id, viewing_party_id: viewing_party.id, user_type: 'Hosting')
      params[:user_ids].each do |user_id, invited|
        if invited == '1'
          UserViewingParty.create(user_id: user_id, viewing_party_id: viewing_party.id, user_type: 'Invited')
        end
      end
      redirect_to dashboard_path
    else
      flash[:error] = 'Please fill in all fields'
      redirect_to "/dashboard/movies/#{facade.movies.id}/viewing_parties/new"
    end
  end

  private
    def viewing_party_params
      params.permit(:movie_id, :created_at, :start_time, :duration)
    end

    def user
      current_user
    end
end
