class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top rated"
      @movies = MovieFacade.top_movies
    elsif params[:keyword] != nil
      @movies = MovieFacade.movies_search(params[:keyword])
    end
  end
end