class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_movies]
      @movies = ThemoviedbService.new.top_movies
      @header = "Top Movies"
    elsif params[:title] != nil
      @movies = ThemoviedbService.new.movie_titles(params[:title])
      @header = "Search Results"
    end
  end
end