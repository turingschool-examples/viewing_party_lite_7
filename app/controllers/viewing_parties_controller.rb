class ViewingPartiesController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
    @party = @user.viewing_parties.new
  end

  def create
    @party = ViewingParty.new(party_params)
    if @party.save
      redirect_to dashboard_user_path, notice: 'Party created successfully!'
    else
      @movie = Movie.find(params[:movie_id])
      @users = User.all
      flash.now[:alert] = 'Failed to create the party!'
      render :new
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time, user_ids: [])
  end
end
