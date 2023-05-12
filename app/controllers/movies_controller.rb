class MoviesController < ApplicationController
  def index
    user = User.find(params[:user_dashboard_id])
    movie_facade = MovieFacade.new(user)

    if params[:q] == 'top rated'
      @facade = movie_facade.top_20_movies
    else
      @facade = movie_facade.search_movies(params[:q])
    end
  end
end
