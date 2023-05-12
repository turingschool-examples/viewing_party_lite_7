class MovieController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def results
    @user = User.find(params[:user_id])
    # @movies = MovieFacade.search_by_title(params[:keywords])
  end
end