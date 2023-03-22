class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:q] == "keyword"
                MoviesFacade.searched_movies(params[:title])
              else
                MoviesFacade.top_rated_movies
              end
  end
end
