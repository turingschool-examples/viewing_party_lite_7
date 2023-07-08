class Users::MoviesController < ApplicationController
  before_action :get_user

  def index
    @facade = MoviesFacade.new(params[:search_field])
  end

  def show
    @facade = MovieFacade.new(params[:id])
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end
end