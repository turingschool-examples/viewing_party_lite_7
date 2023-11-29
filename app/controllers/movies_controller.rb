class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # shortened to search by until I can get movie_search working
      @movies = MovieService.search_movies(params[:query])
    else
      @movies = MovieService.get_movies.first(20)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end