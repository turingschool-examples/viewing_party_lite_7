class UsersController < ApplicationController
  def show
    @user = User.includes(viewing_parties: [:movie, :user]).find(params[:id])
    @viewing_parties = @user.viewing_parties
    @movie_details = @viewing_parties.map do |party|
      MovieFacade.movie_details(party.movie_id)
    end
  end
  
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end


