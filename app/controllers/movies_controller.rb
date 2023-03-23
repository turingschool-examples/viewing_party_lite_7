class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params.include?(:search)
      @search = MovieFacade.new.search_results(params[:search])
    elsif
      @top_movies = MovieFacade.new.pop_movies
    end
  end
end