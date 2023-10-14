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
    movie_service = MovieDbService.new
    @movie = MovieFacade.movie_details(params[:id])
    @cast = MovieFacade.movie_cast(params[:id])
    @reviews = MovieFacade.movie_reviews(params[:id])
  end
end

