class MoviesController < ApplicationController
  def index; end

  def search
    @movies = if params[:q] == 'top20rated'
                facade.top_20_movies
              else
                facade.searched_movies(params[:q])
              end
  end

  def show
    @movie = facade.movie
    @cast_members = facade.cast_members
    @reviews = facade.reviews
  end

  private

  def facade
    MovieFacade.new(params[:movie_id])
  end
end
