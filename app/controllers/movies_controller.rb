class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @movies = DashboardFacade.search_movies(params[:query])
  end

  def show
    @user = User.find(params[:user_id])
    @movie = DashboardFacade.movie_details(params[:id])
  end
end
