class MovieDetailsController < ApplicationController
  def show
    @movie = Movie.find(params[:id])

    @actors = MovieDetailsFacade.movie_cast(@movie)
    @details = MovieDetailsFacade.movie_details(@movie)
    @reviews = MovieDetailsFacade.movie_reviews(@movie)
  end
end