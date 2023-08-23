class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_movies
  end
end