class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
    @movies = @user.viewing_parties.map do |party|
      MovieFacade.get_movie_details(party.movie_id)
    end
  end

  def new 
    @user = User.new
  end

  def create 
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user.id)
    else
      flash[:error] = "Sorry, I'ma need you to try harder."
      redirect_to register_path
    end
  end

  def discover
    @user = User.find(params[:user_id])
  end

  private 

  def user_params
    params.permit(:name, :email)
  end

end