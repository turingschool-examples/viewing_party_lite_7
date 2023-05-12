class MoviesController < ApplicationController
  def index
    @top_movies = MoviesFacade.new.top_rated_movies
    @search = MoviesFacade.new.search_movies(params[:query])
  end

  def show
    # require 'pry'; binding.pry
    @movie = MoviesFacade.new.movie_details(params[:movie_id])
  end
end