class UserMoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:q] == 'top_rated'
      @top_movies = MovieFacade.top_rated
    elsif params[:search]
      @search_results = MovieFacade.movie_search(params[:search])
    else
      redirect_to "/users/#{@user.id}/discover"
    end
    # @top_movies = MovieFacade.top_rated
  end
end