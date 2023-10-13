class MoviesController < ApplicationController
  def index
  end

  def search
    if params[:q] == "top20rated"
      @movies = facade.top_20_movies
    else
      @movies = facade.searched_movies(params[:q])
    end
  end
  
  def show
    @movie = facade.movie
    @cast_members = facade.cast_members
    @reviews = facade.reviews
  end

  private 

  def facade
    MovieFacade.new(params[:movie_id])
  end
end