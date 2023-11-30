class PartiesController < ApplicationController
  
  def new
    @movie = Movie.details(params[:movie_id])
    @user = User.find(params[:user_id])
  end

  def create
    if Movie.where("tmdb_id = ?", params[:movie_id]).count > 0
      @movie = Movie.where("tmdb_id = ?", params[:movie_id]).first
    else
      Movie.create_from_api(params[:movie_id])
    end
    @user = User.find(params[:user_id])
    new_party = Party.new(parties_params)
    if new_party.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = "Party already created"
      redirect_to "/users/#{@user.id}/movies/#{new_party.movie_id}/viewing-party/new"
    end
  end

  private
  def parties_params
    params.permit(:start_time, :name, :duration, :date, :movie_id)
  end

end