class ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.new.find_movie(params[:movie_id])
  end
end