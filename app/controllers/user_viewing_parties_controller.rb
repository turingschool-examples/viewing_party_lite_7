class UserViewingPartiesController < ApplicationController
  def new
    @movie = MovieSearch.new.full_movie_details_by_id(params[:movie_id])
    @user = User.find(params[:user_id])
  end

  def create
    viewing_party = ViewingParty.new(viewing_party_params)
    if viewing_party.duration < params[:movie_runtime].to_i
      redirect_to "/users/#{params[:id]}/movies/#{params[:movie_id]}/viewing-party/new"
      flash[:alert] = 'Error: Viewing Party must be at least as long as movie.'
    elsif viewing_party.save
      viewing_party.create_associations(params[:id], params[:invitees])
      redirect_to "/users/#{params[:id]}"
      flash[:notice] = "#{params[:movie_title]} Viewing Party successfully created!"
    else
      redirect_to "/users/#{params[:id]}/movies/#{params[:movie_id]}/viewing-party/new"
      flash[:alert] = "Error: #{error_message(viewing_party.errors)}"
    end
  end

  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :day, :start_time, :movie_title, :invitees)
  end
end
