class Users::ViewingPartiesController < ApplicationController
  def new
    movie_facade = MoviedbFacade.new(params)
    @movie = movie_facade.all_movie_info
    @host = User.find(params[:user_id])
    @invitees = User.where("id != #{@host.id}") #this should be refactored into model method
    @party = Party.new
  end

  def create
    # require 'pry'; binding.pry
    @new_party = Party.create!(party_params) # .new & .save to include flash error messages
    @invitees = User.where(id: params[:invitees].reject(&:empty?))

    @invitees.each do |invitee|
      PartyUser.create!(host_id: params[:host_id], user_id: invitee.id, party_id: @new_party.id)
    end
    
    PartyUser.create!(host_id: params[:host_id], user_id: params[:host_id], party_id: @new_party.id)
    
    redirect_to "/users/#{params[:host_id]}"
  end

  private
  def party_params
    params.permit(:duration_minutes, :start_time, :date, :movie_id, :host_id)
  end
end