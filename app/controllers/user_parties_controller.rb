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
    user_party = UserParty.new()
    binding.pry
  end

  private 
  def user_parties_params
    params.permit(:duration, :day, :start_time)
  end
end