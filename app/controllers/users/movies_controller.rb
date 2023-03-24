class Users::MoviesController < ApplicationController

  def index
    movie_facade = MoviedbFacade.new(params)
    if params[:search].present?
      @user = User.find(params[:id])
      @keyword = params[:search] # refactor - now part of params
      @search_result_movies = movie_facade.movies_keyword_search
    elsif
      @user = User.find(params[:id])
      @top_20_movies = movie_facade.top_20_movies
    # else
      #flash message
    end
  end

  def show
    @user = User.find(params[:id])
    @the_movie = MoviedbFacade.new(params).all_movie_info
  end
end