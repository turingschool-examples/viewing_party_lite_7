class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:query] == ""
      redirect_to user_discover_index_path(@user)
      flash.notice = "No Search Terms Provided."
    elsif params[:query].present?
      @facade = MovieSearchFacade.new(params[:query])
    else
      @facade =PopularMoviesFacade.new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie_facade = DetailedMovieFacade.new(params[:id])
    @cast_facade = MovieCastFacade.new(params[:id])
    @reviews_facade = MovieReviewsFacade.new(params[:id])
  end
end