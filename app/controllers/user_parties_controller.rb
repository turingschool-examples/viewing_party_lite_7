class UserPartiesController < ApplicationController
  before_action :find_user, only: [:new, :index]

  def index
    @parties = @user.user_parties
  end

  def new
    @movie_facade = DetailedMovieFacade.new(params[:movie_id])
  end

  def create
    user = User.find(params[:user_id])
    movie = DetailedMovieFacade.new(params[:movie_id]).detailed_movie

    if params[:duration].to_i < movie.runtime
      redirect_to new_user_movie_viewing_party_path(user, movie.id)
      flash.notice = "Error! Viewing party duration cannot be less than the movie runtime, please fill this out correctly."
      return
    end

    party = Party.create!(user_parties_params)
    party.update!(movie_title: movie.title, movie_id: movie.id)

    if params[:invitees]
      params[:invitees].each do |id|
        UserParty.create!(user_id: id.to_i, party_id: party.id, host: false, host_id: user.id)
      end
    end

    UserParty.create!(user_id: params[:user_id], party_id: party.id, host: true, host_id: params[:user_id])
    redirect_to user_path(user)
  end

  private 
  
  def user_parties_params
    params.permit(:duration, :day, :start_time)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end