class MoviesController < ApplicationController

  def search
    @facade = MovieFacade.new(params[:search])
  end

  def show
    movie_id = params[:id]
    @movie = facade.movie
  end

  private

  def facade
    MovieFacade.new(params[:movies_id])
  end
end