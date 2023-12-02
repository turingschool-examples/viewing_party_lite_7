class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = PreviewFacade.new(params[:query]).movie_previews
  end

  def show 
    facade = MovieFacade.new(params[:id])
    @movie = facade.get_movie
    @cast = facade.get_cast
    @reviews = facade.get_reviews
    @review_count = @reviews.count
    @user = User.find(params[:user_id])
  end
end
