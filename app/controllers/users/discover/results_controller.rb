require './poros/movie'
require './services/movies_search'
class Users::Discover::ResultsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    movies_search = MoviesSearch.new
    if params[:top_rated].present?
      @top_rated = movies_search.top_movies
    elsif params[:title].present?
      @search_result = movies_search.search_movies(params[:title])
    end
  end

  def show 
    @user = User.find(params[:user_id])
    movies_search = MoviesSearch.new
    @movie = movies_search.genre_runtime(params[:movie_id])
    @cast_members = movies_search.movie_cast(params[:movie_id])
    @reviews = movies_search.movie_reviews(params[:movie_id])
    @reviews_count = movies_search.movie_review_count(params[:movie_id]) # had to add this bc i couldnt figure out how to pull from outside hash
  end
end
