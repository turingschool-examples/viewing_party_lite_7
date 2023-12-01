class MoviesController < ApplicationController
  def search
    @facade = MovieFacade.new(params[:search])
  end

  def show
    @movie = facade.movie
    @cast_members = facade.cast_members
    @reviews = facade.reviews
    @review_count = @reviews.count
  end

  private

  def facade
    MovieFacade.new(params[:movies_id])
  end
end
