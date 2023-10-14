class ViewingPartiesController < ApplicationController
  def new 
    @users = User.all
    @user = User.find(params[:user_id])
    @movie_id = (params[:movie_id])
    @facade = MoviesDetailsFacade.new(@movie_id)
  end

  def create
    @facade = MoviesDetailsFacade.new(@movie_id)
    @movie_id = (params[:movie_id])
    @user = User.find(params[:user_id])
    viewing_party = ViewingParty.new(viewing_params)
    @users = User.all
    if viewing_party.save
      PartyGuest.create(user_id: @user.id, viewing_party_id: viewing_party.id, host: true)
      User.where.not(id: @user.id).each do |user|
        PartyGuest.create(user_id: user.id, viewing_party_id: viewing_party.id, host: false)
      end
      redirect_to user_path(@user)
    else 
      flash[:alert] = "Please fill in all fields."
      redirect_to new_user_movie_viewing_party_path(@user, @movie_id)
    end
  end

  def find_movie
    @movie = facade.find_movie(params[:movie_id])
  end

  private

  def viewing_params
    params.permit(:duration, :party_date, :start_time, :movie_id)
  end
end