class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @movie = MoviesFacade.movie_by_id(params[:movie_id])
    @movie1 = MoviesFacade.movies_cast(params[:movie_id])
    @movie2 = MoviesFacade.movie_reviewed(params[:movie_id])
  end

  def create
    
  end
end