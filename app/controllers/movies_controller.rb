class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @movies = 
    if params[:search].present?
      MoviesFacade.movies_by_keyword(params[:search])
    else
      MoviesFacade.top_twenty_movies[0..19]
    end
  end

  def show
    @user = User.find(params[:id])
    @movie = MoviesFacade.movie_by_id(params[:movie_id])
    @movie1 = MoviesFacade.movies_cast(params[:movie_id])
    @movie2 = MoviesFacade.movie_reviewed(params[:movie_id])
  end
end