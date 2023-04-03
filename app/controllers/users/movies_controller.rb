class Users::MoviesController < ApplicationController

  def index
    movie_facade = MoviedbFacade.new(params)
    @user = User.find(params[:id])

    if params[:search].present?
      @keyword = params[:search] 
      @search_result_movies = movie_facade.movies_keyword_search
    elsif
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