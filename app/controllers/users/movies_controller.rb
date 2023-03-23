class Users::MoviesController < ApplicationController
  def index
    movie_facade = MoviedbFacade.new
    if params[:search].present?
      @user = User.find(params[:id])
      @keyword = params[:search]
      @search_result_movies = movie_facade.get_movie_search(params[:search])
    elsif
      @user = User.find(params[:id])
      @top_20_movies = movie_facade.get_top_movies
    # else
      #flash message
    end
  end

end