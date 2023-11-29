class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:query].present?
      # shortened to search by until I can get movie_search working
      @movies = MovieService.search_movies(params[:query])
    else
      @movies = MovieService.get_movies.first(20)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = Movie.all.find(params[:id])
    # this still isn't working; we'll need to use the movie poro id to render the show page
  end
end