class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @movies = 
    # if params[:search].present?
    #   MoviesFacade.movies_by_keyword(params[:search])
    # else
      MoviesFacade.top_twenty_movies
    # end
  end
end