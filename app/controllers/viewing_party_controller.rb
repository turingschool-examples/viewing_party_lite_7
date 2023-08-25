class ViewingPartyController < ApplicationController 
  def new 
    @movie = MovieFacade.get_movie_details(params[:id])
    @user = User.find(params[:user_id])
    # @viewing_party = ViewingParty.new

  end

  # def create
  #   user = User.find(params[:user_id])
  #   party = ViewingParty.new(viewing_party_params)
  #   if party.save 
  #     redirect_to user_path(user)
  #   else
  #     flash[:error] = "Please fill in all fields"
  #     redirect_to new_user_movie_viewing_party_path(user, params[:movie_id])
  #   end
  # end

  private
  
  def viewing_party_params
    params.require(:viewing_party).permit(:duration, :date, :time, :movie_id)
  end


end