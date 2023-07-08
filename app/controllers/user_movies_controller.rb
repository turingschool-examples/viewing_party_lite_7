class UserMoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:keyword].present?
                MovieSearch.new.keyword_search(params[:keyword])
              else
                MovieSearch.new.discover_popular
              end
  end

  def show
    @movie = MovieSearch.new.full_movie_details_by_id(params[:movie_id])
    @user = User.find(params[:user_id])
  end
end
