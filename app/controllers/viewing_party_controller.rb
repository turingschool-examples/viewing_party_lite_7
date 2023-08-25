class ViewingPartyController < ApplicationController 
  def new 
    @movie = MovieFacade.get_movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    user = User.find(params[:user_id])
    party = ViewingParty.new(viewing_party_params)
    movie = MovieFacade.get_movie_details(params[:movie_id])
    users = User.all
    if movie.minutes < params[:duration].to_i 
      party.save 
      UserViewingParty.create(user_id: user.id, viewing_party_id: party.id, host: true)
      users.each do |u|
        if params[u.name] == "1"
          UserViewingParty.create(user_id: u.id, viewing_party_id: party.id)
        end
      end
      redirect_to user_path(user)
    else
      flash[:error] = "Please, you gonna cut this party short?"
      redirect_to new_user_movie_viewing_party_path(user, params[:movie_id])
    end
  end

  private
  
  def viewing_party_params
    params.permit(:duration, :date, :time, :movie_id, :start_time, :movie_image, :movie_title)
  end

end