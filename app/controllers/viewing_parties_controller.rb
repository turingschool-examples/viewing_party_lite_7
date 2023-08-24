class ViewingPartiesController < ApplicationController
  def new
    # @movie = MovieService.new
    # @movie.movie_by_id(params[:id])
    # the issue might be that this is supposed to be the joins table user_viewing_party new path
    @movie = Movie.find(params[:id])
    @user = User.find(params[:user_id])
    @viewing_party = ViewingParty.new
  end
end