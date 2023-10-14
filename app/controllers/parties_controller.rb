class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = SearchFacade.new.find_movie(params[:id])
  end

  def create
    if params[:duration] >= params[:movie_duration]
      if params[:invitees]
        create_parties
        redirect_to "/users/#{params[:user_id]}"
      else
        flash[:alert] = "Please invite people"
        redirect_to "/users/#{params[:user_id]}/movies/#{params[:id]}/new"
      end
    else
      flash[:alert] = "You Fool of a Took, you won't have time for the full movie"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:id]}/new"
    end
  end

  private

  def create_parties
    party = Party.create(movie: params[:id], movie_title: params[:title], party_date: params[:party_date], poster_path: params[:image])
    UserParty.create!(user_id: params[:user_id], party_id: party.id, host: true)
    params[:invitees].each do |key, value|
      if value == "1"
        UserParty.create!(user_id: key.to_i, party_id: party.id, host: false)
      end
    end
  end

end