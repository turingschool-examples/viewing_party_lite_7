class UserMoviesController < ApplicationController
  def index 
    require 'pry'; binding.pry
    @user = User.find(params[:user_id])
    
    if params[:search]
      @results = MoviesFacade.search_results(params[:search])
    elsif params[:top_rated]
      @results = MoviesFacade.top_rated_movies
    end
  end

end