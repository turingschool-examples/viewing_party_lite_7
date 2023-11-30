class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:query].present?
      @movies = MovieService.search_movies(params[:query])
    else
      @movies = MovieService.get_movies.first(20)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieService.get_detailed_movie(params[:id])
    @cast = MovieService.get_movie_cast(params[:id]).first(10)
    @reviews = MovieService.get_movie_reviews(params[:id])
  end
end