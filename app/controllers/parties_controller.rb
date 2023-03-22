class PartiesController < ApplicationController
  def new 
    @movie = MoviesFacade.individual_movie(params[:movie_id])
    @cast = MAKE API CALL 
    @reviews = MAKE API CALL 
    @user = User.find(params[:user_id])
  end
end
