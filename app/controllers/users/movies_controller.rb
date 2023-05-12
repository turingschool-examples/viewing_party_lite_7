class Users::MoviesController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    if params[:q].empty?
      flash[:alert] = 'Please enter a movie'
      redirect_to user_discover_index_path(params[:user_id])
    else
      @movies = MovieFacade.new.get_movies(params[:q])
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
