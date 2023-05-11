class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q].present?
      @movies = MovieFacade.new.search_movies(params[:q])
    else
      @movies = MovieFacade.new.top_rated_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new.all_movie_data(params[:id])
  end
end