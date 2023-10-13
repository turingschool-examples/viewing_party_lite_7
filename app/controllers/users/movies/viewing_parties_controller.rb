class Users::Movies::ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = ThemoviedbService.new.movie_details(params[:movie_id])
    @users = User.excluding(@user)
  end

  def create
    users = User.all
    if params[:duration].to_i < params[:runtime].to_i
      redirect_to new_user_movie_viewing_party_path((params[:user_id]), (params[:movie_id]))
      flash[:error] = "Party duration cannot be less than movie runtime"
    else
      party = ViewingParty.create!(
        duration: (params[:duration]),
        date: (params[:date]),
        start_time: (params[:start_time]),
        movie_id: (params[:movie_id]),
        host_user_id: (params[:user_id])
        )
      result = users.map do |user|
        if params["#{user.id}"] == "1"
          UserViewingParty.create!(user_id: user.id, viewing_party_id: party.id)
        end
      end
      redirect_to user_path(params[:user_id])
    end
  end
end