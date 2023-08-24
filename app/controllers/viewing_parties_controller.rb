class ViewingPartiesController < ApplicationController
  before_action :find_user_and_movie, only: [:new]

  def new
  end

  private
  def find_user_and_movie
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:movie_id])
  end
end