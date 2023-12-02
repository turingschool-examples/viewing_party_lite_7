class ViewingPartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:id])
    @movie_runtime = params[:movie_runtime]
    @movie_title = params[:movie_title]
    @movie_id = params[:movie_id]
  end

  def create
    @user = User.find(params[:id])
    @attendees = params[:user_ids]

    viewing_party_params = {
      party_duration: params[:party_duration],
      start_time: params[:start_time],
      movie_title: params[:movie_title],
      movie_id: params[:movie_id],
      host_id: @user.id
    }

    @viewing_party = ViewingParty.create!(viewing_party_params)

    @viewing_party.add_attendees(@attendees)

    # adds in the user who created the viewing party
    @viewing_party.users << @user

    # find the host in the UserViewingParty table
    @user_viewing_party = UserViewingParty.find_by(user_id: @user.id, viewing_party_id: @viewing_party.id)

    @user_viewing_party&.update(host: true)

    if @viewing_party.save
      flash[:alert] = 'Viewing Party Created!'
      redirect_to user_dashboard_path(@user.id)
    else
      flash[:alert] = 'Error: Please fill out all fields'
      render :new
    end
  end
end
