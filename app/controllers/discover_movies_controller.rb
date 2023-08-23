class DiscoverMoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.search_movies(params[:search])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end
end