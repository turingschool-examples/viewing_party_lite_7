class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:search_field]
      @results = TmdbSearch.new.movie_search(params[:search_field]).search_results
    else
      @results = TmdbDiscover.new.top_rated_list.top_rated_movies
    end
  end

  def show 
    @user = User.find(params[:id])
    @movie = params[:movie_id]
    @actors = TmdbActors.new.movie_actors(@movie).actors
    @reviews = TmdbReviews.new.movie_reviews(@movie)
    @details = TmdbDetails.new.movie_details(@movie)
  end
end