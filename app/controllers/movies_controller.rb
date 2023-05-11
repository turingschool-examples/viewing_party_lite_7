class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = nil
    
    if params[:commit] == "Search"
      @movies = MovieFacade.movie_search(params[:title])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show 
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
    @cast = MovieFacade.cast(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
  end
end