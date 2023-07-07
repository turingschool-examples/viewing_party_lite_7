class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:search].present?
      @movies = MovieFacade.new(params).search_movies
    else
      @movies = MovieFacade.new(params).top_rated_movies
    end
  end
  
  def show
  end
end