class MoviesController < ApplicationController
  def show
    @movie = MovieFacade.details(params[:id])
    @cast = MovieFacade.cast(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
  end
end

