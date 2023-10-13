class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:query].present?
      @movies_facade = MoviesFacade.new(params[:query])
    elsif params[:top_rated]
      @movies_facade = MoviesFacade.new(params[:query] = nil, params[:top_rated] = true)
    else
      redirect_to discover_user_path(@user)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new(params[:id]).movie_details
    @cast = MovieFacade.new.(params[:id]).movie_cast
    @reviews = MovieFacade.new.(params[:id]).movie_reviews
  end
end

