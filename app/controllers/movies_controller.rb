# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    if params[:q] == "keyword"
      @movies = MoviesFacade.new.movie_search(params[:search])
    else
      @movies = MoviesFacade.new.movie_discover
    end
  end

  def show
    @facade = MoviesFacade.new(params[:id])
  end
end
