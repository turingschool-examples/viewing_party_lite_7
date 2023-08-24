class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MoviesService.new.find_movie(params[:movie_id])
  end
end