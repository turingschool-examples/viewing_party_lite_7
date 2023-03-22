class Users::MoviesController < ApplicationController
  def index
    # if params[:search].present?
    #   # @keyword = params[:search]
    #   @user = User.find(params[:id])
    # elseif
    #   @user = User.find(params[:id])
    # else
    #   # flash message
    # end
    # require 'pry'; binding.pry
    if params[:search].present?
      @search_result_movies = MoviedbFacade.movie_search(params[:search])
    elsif
      @top_20_movies = MoviedbFacade.top_movie_info
    else
      #flash message
    end
  end

end