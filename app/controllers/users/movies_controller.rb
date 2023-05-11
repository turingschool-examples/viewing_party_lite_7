class Users::MoviesController < ApplicationController
  def index
    if params[:q].empty?
      flash[:alert] = 'Please enter a movie'
      redirect_to user_discover_index_path(params[:user_id])
    elsif params[:q] == 'top%20rated'
      @user = User.find(params[:user_id])
      @movies = MovieFacade.new.top_rated
    else
      @user = User.find(params[:user_id])
      @movies = MovieFacade.new.search(params[:q])
    end
  end
end