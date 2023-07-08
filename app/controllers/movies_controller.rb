class MoviesController < ApplicationController
  def index
    @facade = MovieFacade.new(params)
  end

  def show
    @facade = MovieFacade.new(params)
    @movie = MovieFacade.movie_details(params[:id])
  end
end
