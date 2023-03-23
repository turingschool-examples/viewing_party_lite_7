class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.search_results(params[:movie_title])
    @user= User.find(params[:user_id])
  end
end