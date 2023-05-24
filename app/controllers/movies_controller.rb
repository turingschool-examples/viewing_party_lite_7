class MoviesController < ApplicationController
  before_action :get_user

  def index
    @facade = MoviesFacade.new(params[:q])
  end

  def show
    @facade = MovieFacade.new(params[:id])
  end

  private

  def get_user
    @user = User.find(session[:user_id])
  end
end
