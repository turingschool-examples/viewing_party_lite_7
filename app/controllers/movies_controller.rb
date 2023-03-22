# require './facade/top_movies_facade.rb'
class MoviesController < ApplicationController
  def index
    require 'pry'; binding.pry
    @user = User.find(params[:user_id])
    if params[:q] == "keyword"
      @keyword_movies
    else
      @top_rated_movies = TopMoviesFacade.top_rated_info
    end
  end
end