class ViewingPartyController < ApplicationController

  def new
    begin 
      @user = User.find(params[:user_id])
      raise "Please #{view_context.link_to ' log in or register', root_path} to create a viewing party" unless logged_in?
      @users = User.all
      @facade = MoviesDetailsFacade.new(params[:movie_id])
    rescue StandardError => e
      redirect_to user_movie_path(@user, params[:movie_id])
      flash[:error_login_required] = e.message
    end
  end
  
  def create
    movie_id = (params[:movie_id])
    user = User.find(params[:user_id])
    @users = User.all
    viewing = ViewingParty.new(view_params)
    if viewing.save
      @users.each do |user|
        if params[user.id.to_s] == "1"
          UserViewingParty.create!(user_id: user.id, viewing_party_id: viewing.id)
        end
      end
      flash[:success] = "New Viewing Party created successfully."
      redirect_to user_path(user)
    else 
      flash[:error] = "Viewing Party could not be created"
      redirect_to new_user_movie_viewing_party_path(user, movie_id)
    end
  end

  private

  def view_params
    params.permit(:duration, :date, :start_time, :movie_id) 
  end
end