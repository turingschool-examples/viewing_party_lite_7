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
end
