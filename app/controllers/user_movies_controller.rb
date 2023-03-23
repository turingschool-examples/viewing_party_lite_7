class UserMoviesController < ApplicationController
  before_action :set_user

  def index 
    if params[:search]
      @results = MoviesFacade.search_results(params[:search])
    elsif params[:top_rated]
      @results = MoviesFacade.top_rated_movies
    end
  end

  def show 
    @movie = MoviesFacade.individual_movie(params[:id])
  end

  private 

  def set_user 
    @user = User.find(params[:user_id])
  end

end