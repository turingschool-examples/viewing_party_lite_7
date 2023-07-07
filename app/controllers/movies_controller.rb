require './app/services/tmdb_search'
require './app/services/tmdb_discover'

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:search_field]
      @results = TmdbSearch.new.movie_search(params[:search_field]).search_results
    else
      @results = TmdbDiscover.new.top_rated_list.top_rated_movies
    end
  end
end