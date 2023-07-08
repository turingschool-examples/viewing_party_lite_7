class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:search_field]
      @results = TmdbFacade.new.movie_search(params[:search_field]).search_results
    else
      @results = TmdbFacade.new.top_rated_list.top_rated_movies
    end
  end

  def show 
    @user = User.find(params[:id])
    @movie = params[:movie_id]
    @actors = TmdbFacade.new.movie_actors(@movie).actors
    @reviews = TmdbFacade.new.movie_reviews(@movie)
    @details = TmdbFacade.new.movie_details(@movie)
  end
end