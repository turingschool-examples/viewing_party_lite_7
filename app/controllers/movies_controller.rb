class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies_facade = MoviesFacade.new(query: params[:query])
    elsif params[:top_rated]
      @movies_facade = MoviesFacade.new(top_rated: params[:top_rated])
    end
  end

  def show
    @movie_facade = MovieFacade.new(params[:id])
    @movie = MovieFacade.details(params[:id])
    @cast = MovieFacade.cast(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
  end
end

