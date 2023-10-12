class SearchController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])

    if params[:q] == "top"
      @movies = SearchFacade.new.top_rated
    else
      @movies = SearchFacade.new.search(params[:search_movies])
      @searched = params[:search_movies]
    end
  end
end