class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_dashboard_id])
    if params[:q] == 'top rated'
      @movies = MovieFacade.new.top_20_movies
      @is_top_rated = true
    else
      @movies = MovieFacade.new.search_movies(params[:q])
      @search = params[:q]
    end
  end

  def show

  end
end
