class MoviesController < ApplicationController
  def index
    if params[:search_by].present?
      # shortened to search by until I can get movie_search working
      @movies = MovieService.get_movies.first.movie_search(params[:search_by_title])
    else
      @movies = MovieService.get_movies.first(20)
    end
  end
end