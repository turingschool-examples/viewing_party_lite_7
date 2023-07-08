class UserMoviesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    if params[:keyword].present?
      @movies = MovieSearch.new.keyword_search(params[:keyword])
    else
      @movies = MovieSearch.new.discover_popular
    end
  end

  def show 
    @movie = MovieSearch.new.full_movie_details_by_id(params[:movie_id])
  
  end
end