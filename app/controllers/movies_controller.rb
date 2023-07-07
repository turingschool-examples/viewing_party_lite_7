class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:search].present?
                  MovieFacade.new.search(params[:search])
              else
                  MovieFacade.new.top_rated
              end
  end
end