class Users::MoviesController < ApplicationController
  def index
  
    if params[:search].present?
      @user = User.find(params[:id])
      @keyword = params[:search]
      @search_result_movies = MoviedbFacade.get_movie_search(params[:search])
    elsif
      @user = User.find(params[:id])
      @top_20_movies = MoviedbFacade.get_top_movies
    # else
      #flash message
    end
  end

end