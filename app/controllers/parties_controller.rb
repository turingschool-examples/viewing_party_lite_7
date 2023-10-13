class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = SearchFacade.new.find_movie(params[:id])
    @invitees = []
  end

  def create
    if params[:invites]
      invite_array = params[:invites].split
      invite_hash = {"1" => [], "0" => []}
      invite_array.each do |invite|
      invite_hash[params[invite]] << invite
      end

      party = Party.create(movie: params[:id], movie_title: params[:title], party_date: params[:party_date])
      UserParty.create(user_id: params[:user_id], party_id: party.id, host: true)
  
      invite_hash["1"].each do |invitee|
        UserParty.create(user_id: invitee, party_id: party.id, host: false)
      end
      redirect_to "/users/#{params[:user_id]}"
    else
      flash[:alert] = "Please invite people"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:id]}/new"
    end
  end
end