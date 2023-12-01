class MoviesController < ApplicationController
  def index
    if params[:Movie_Title].present?
      facade = MovieFacade.new
      @results = facade.search_movies(params[:Movie_Title])
    else
      facade = MovieFacade.new
      @results = facade.top_movies
    end
  end

  def show
    facade = MovieFacade.new
    @movie_details = facade.movie_details(params[:id])
    @movie_cast = facade.movie_cast(params[:id])
    @movie_review = facade.movie_reviews(params[:id])
  end
end 