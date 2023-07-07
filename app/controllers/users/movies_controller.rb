class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.new(params).search
  end

  def show
  end
end