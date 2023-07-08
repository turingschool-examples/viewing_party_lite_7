class UserViewingPartiesController < ApplicationController 
  def new
    @movie = MovieSearch.new.full_movie_details_by_id(params[:movie_id])
    @user = User.find(params[:user_id])
  end

  def create
    viewing_party = ViewingParty.new(viewing_party_params)
    UserViewingParty.create!()
    if viewing_party.save
      redirect_to "/users/#{params[:id]}"
    else
      redirect_to "/users/#{params[:id]}/movies/#{params[:movie_id]}/viewing-party/new"
      flash[:alert] = "Error: #{error_message(viewing_party.errors)}"
    end
  end

  private 
  def viewing_party_params
    params.permit(:movie_id, :duration, :day, :start_time, :movie_title)
  end
end