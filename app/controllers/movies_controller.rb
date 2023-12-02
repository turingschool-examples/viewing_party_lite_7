class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = PreviewFacade.new(params[:query]).movie_previews
  end

  def show 
    @movie = MovieFacade.get_movie(params[:movie_id])
    @cast = MovieFacade.get_cast(params[:movie_id])
    @reviews = MovieFacade.get_reviews(params[:movie_id])
    @review_count = MovieFacade.count_reviews(params[:movie_id])
    # @user = User.find(params[:id])
    # require 'pry'; binding.pry
  end
end
