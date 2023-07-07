class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.new(params).search
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new(params).search
  end
end
