# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    if params[:q] == "keyword"
      @movies = MoviesFacade.new.movie_search(params[:search])[:results]
    else
      @movies = MoviesFacade.new.movie_discover[:results][0..19]
    end
  end

  def show
    @facade = MoviesFacade.new(params[:id])
  end
end
