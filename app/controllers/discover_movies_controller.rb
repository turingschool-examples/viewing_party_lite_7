class DiscoverMoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.search_movies(params[:search])
    else
      @movies = MovieFacade.top_rated_movies

      @actors = MovieDetailsFacade.movie_cast(@movies[0])
      @details = MovieDetailsFacade.movie_details(@movies[0])
      @reviews = MovieDetailsFacade.movie_reviews(@movies[0])

    end
  end
end