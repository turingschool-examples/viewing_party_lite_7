class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q].present?
      @movies = MovieFacade.search_movies(params[:q])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show
    
  end
end