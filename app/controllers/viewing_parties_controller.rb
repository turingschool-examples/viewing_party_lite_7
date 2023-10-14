class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
    @party = @user.viewing_parties.new
  end

  def create
    @user = User.find(params[:user_id])
    @party = ViewingParty.new(party_params)
    
    if @party.save
      redirect_to user_path, notice: 'Party created successfully!'
    else
      @movie = MovieFacade.movie_details(params[:movie_id])
      @users = User.all
      flash.now[:alert] = 'Failed to create the party!'
      redirect_to new_viewing_party_path(@user, @movie)
    end
  end

  private

  def party_params
    params.require(:viewing_party).permit(:duration, :date_time, :start_time, user_ids: [])
  end
end
