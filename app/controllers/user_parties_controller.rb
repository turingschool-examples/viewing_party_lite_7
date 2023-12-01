class UserPartiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @parties = @user.user_parties
  end

  def new
    @user = User.find(params[:user_id])
    @movie_facade = DetailedMovieFacade.new(params[:movie_id])
  end

  def create
    user = User.find(params[:user_id])
    movie = DetailedMovieFacade.new(params[:movie_id]).detailed_movie
    party = Party.create!(user_parties_params)
    party.update!(movie_title: movie.title)

    UserParty.create!(user_id: params[:user_id], party_id: party.id, host: true)
    redirect_to user_path(user)
  end

  private 
  def user_parties_params
    params.permit(:duration, :day, :start_time)
  end
end