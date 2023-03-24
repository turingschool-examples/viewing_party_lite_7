class MoviesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:id])
    @actors = MovieFacade.top_cast(params[:id])
  end
end