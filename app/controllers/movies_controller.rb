class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_dashboard_id])
    # require 'pry'; binding.pry
    if params[:q] == "top rated"
      @movies = MovieFactory.new.top_20_movies
      @is_top_rated = true
    else 
      @movies = MovieFactory.new.search_movies(params[:q])
      @search = params[:q]
    end
  end
end