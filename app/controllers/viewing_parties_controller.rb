class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie(params[:movie_id])
    @invitees = @user.friends
  end

  def create
    # require 'pry'; binding.pry
    mov = MovieFacade.movie(params[:movie_id])

    # convert poro::movie to ar::movie
    ViewingParty.create!(
      duration: params[:duration_of_party],
      day: params[:day],
      time: params[:start_time],
      host_id: params[:user_id]
    ).create_movie!()

    redirect_to discover_user_path(params[:user_id])
  end
end
