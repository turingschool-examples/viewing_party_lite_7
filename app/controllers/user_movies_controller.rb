class UserMoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:q] == 'top_rated'
      @top_movies = MovieFacade.top_rated
    else params[:search] && params[:search] != (nil || '')
      @search_results = MovieFacade.movie_search(params[:search])
    end
    # @top_movies = MovieFacade.top_rated
  end
end