class DiscoverMoviesController < ApplicationController
  def index
    if params[:query]
      @movies = MovieFacade.search_movies(params[:query])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def search

  end
end