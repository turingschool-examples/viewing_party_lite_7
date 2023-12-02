class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    
    @movies = if params[:q] == 'top-rated'
                MovieFacade.top_rated
              else
                MovieFacade.search(params[:search])
              end
  end

  def show
    @user = User.find(params[:id])
    @movie = 

    @movie_info = MovieFacade.movie_details(params[:movie_id])
    @cast = MovieFacade.cast(params[:movie_id])
    @reviews = MovieFacade.reviews(params[:movie_id])
  end
end
