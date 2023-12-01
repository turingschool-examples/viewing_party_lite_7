class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:query].present?
      @facade = MovieSearchFacade.new(params[:query])
    else
      @facade =PopularMoviesFacade.new
      # get_movies.first(20)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie_facade = DetailedMovieFacade.new(params[:id])
    @cast = MovieService.get_movie_cast(params[:id]).first(10)
    @reviews = MovieService.get_movie_reviews(params[:id])
    @movie_poster_facade = MoviePosterFacade.new(params[:id])
  end
end