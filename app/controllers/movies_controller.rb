class MoviesController < ApplicationController
  def index
    @movies = if params[:q] == 'top-rated'
                MovieFacade.top_rated
              else
                MovieFacade.search(params[:search])
              end
  end

  def show
    @movie_info = MovieFacade.movie_details(params[:movie_id])
    @cast = MovieFacade.cast(params[:movie_id])
    @reviews = MovieFacade.reviews(params[:movie_id])
  end
end
