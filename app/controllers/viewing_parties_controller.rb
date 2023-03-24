class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(id: params[:movie_id])
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    viewing_party = ViewingParty.new(party_params)
    if viewing_party.save
      ViewingPartyUser.create!(user: @user, viewing_party: viewing_party, host: true )
      params[:user_ids].each do |id|
        ViewingPartyUser.create!(user: User.find(id), viewing_party: viewing_party)
      end
      flash[:notice] = "Party has been Created!"
      redirect_to "/users/#{@user.id}"
    end

  end

  private

  def party_params
    params.permit(:duration, :date, :time, :movie_id)
  end
end