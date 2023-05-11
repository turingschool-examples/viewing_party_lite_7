class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:query].present?
      @movies = DashboardFacade.search_movies(params[:query])
    else
      @movies = DashboardFacade.top_movies
    end
  end  

  def show
    @user = User.find(params[:user_id])
    @movie = DashboardFacade.movie_details(params[:id])
  end
end
