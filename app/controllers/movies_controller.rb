class MoviesController < ApplicationController
  def index
    @top_movies = MoviesFacade.new.top_rated_movies
    @search = MoviesFacade.new.search_movies(params[:query])
  end
end