class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @facade = MovieDetailsFacade.new(params[:id])
  end
end