class ViewingPartyController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    tmdb_service = TmdbService.new
    @movie = tmdb_service.movie_details(params[:movie_id])
    @movie_thumbnail = tmdb_service.get_movie_image(params[:movie_id])
  end

  def create
    viewing_party = Party.new(host_name: params[:host_name], movie_id: params[:movie_id], duration: params[:duration_of_party], date: params[:date], start_time: params[:start_time], host_id: params[:user_id], movie_title: params[:movie_title], thumbnail: params[:movie_thumbnail])
    if viewing_party.save
      users = User.all
      users.each do |user|
        if params[user.name] == "1"
          UserParty.create!(user_id: user.id, party_id: viewing_party.id)
        end
      end
      # Add host
      UserParty.create!(user_id: params[:user_id], party_id: viewing_party.id)
      redirect_to user_path(params[:user_id])
    else
      flash[:notice] = "Invalid input, please try again"
      render.new
    end
  end

  private

  def party_params
     #
  end
end