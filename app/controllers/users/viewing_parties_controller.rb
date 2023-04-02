class Users::ViewingPartiesController < ApplicationController
  def new
    @movie = MoviedbFacade.new(params).all_movie_info

    @host = User.find(params[:user_id])
    @invitees = User.where("id != #{@host.id}") 
    #Other option:  @invitees = User.where.not(id: @host.id)

    @party = Party.new
  end

  def create
    @new_party = Party.new(party_params) # .new & .save to include flash error messages
    
    if @new_party.save
      @invitees = User.where(id: params[:invitees].reject(&:empty?))
      
      PartyUser.create!(host_id: params[:host_id], user_id: params[:host_id], party_id: @new_party.id)
      
      @invitees.each do |invitee|
        PartyUser.create!(host_id: params[:host_id], user_id: invitee.id, party_id: @new_party.id)
      end
      
      redirect_to "/users/#{params[:host_id]}"
    else
      redirect_it "/users/#{params[:host_id]}/movies/#{params[:movie_id]}/viewing_party/new"
    end
  end

  private
  def party_params
    params.permit(:duration_minutes, :start_time, :date, :movie_id, :host_id)
  end
end