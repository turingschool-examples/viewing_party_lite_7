class Users::ViewingPartiesController < ApplicationController
  def new
    if current_user.nil?
      flash[:message] = "You must be logged in or registered to continue."
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}"
    else
      @movie = MoviedbFacade.new(params).all_movie_info

      @host = User.find(params[:user_id])
      @invitees = User.where("id != #{@host.id}") # should be a scope/class method
      #Other option:  @invitees = User.where.not(id: @host.id)
      
      @party = Party.new
    end
  end

  def create
    @new_party = Party.new(party_params) # .new & .save to include flash error messages
    
    if @new_party.save
      @invitees = User.where(id: params[:invitees].reject(&:empty?)) # this should be a scope/class method
      PartyUser.create!(host_id: params[:host_id], user_id: params[:host_id], party_id: @new_party.id)
      @invitees.each do |invitee|
        PartyUser.create!(host_id: params[:host_id], user_id: invitee.id, party_id: @new_party.id)
      end
      redirect_to "/dashboard"
    else
      redirect_to "/users/#{params[:host_id]}/movies/#{params[:movie_id]}/viewing_party/new"
    end
  end

  private
  def party_params
    params.permit(:duration_minutes, :start_time, :date, :movie_id, :host_id)
  end
end