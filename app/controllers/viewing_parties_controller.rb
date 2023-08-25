class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @users = User.all
    @movie = MoviesFacade.movie_by_id(params[:movie_id])
    @movie1 = MoviesFacade.movies_cast(params[:movie_id])
    @movie2 = MoviesFacade.movie_reviewed(params[:movie_id])
  end

  def create
    @user = User.find(params[:id])
    @movie = MoviesFacade.movie_by_id(params[:movie_id])
    @VP = ViewingParty.new(viewing_party_params)
    # if @movie.runtime < @VP.duration
    #   flash[:notice] = "Runtime is too short"
    #   redirect_to "/users/#{@user.id}/movies/#{params[:movie_id]}/viewing_party"
    # else 
      @VP.save
      redirect_to user_path(@user)
    # end
  end

  private

  def viewing_party_params
    params.permit(:duration, :date, :start_time)
  end
end