class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie_facade = MoviesFacade.new.find_movie(params[:movie_id])
  end

  def create
    if params[:duration].to_i >= params[:movie_duration].to_i
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "Not enough time"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing_party/new"
    end
  end
end
