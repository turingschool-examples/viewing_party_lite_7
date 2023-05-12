class MoviesController < ApplicationController
  def index
    user = User.find(params[:user_dashboard_id])
    movie_facade = MovieFacade.new(user)

    @user_movies = if params[:q] == 'top rated'
                     movie_facade.top_20_movies
                   else
                     movie_facade.search_movies(params[:q])
                   end
  end
end
