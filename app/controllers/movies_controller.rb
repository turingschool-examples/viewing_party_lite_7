class MoviesController < ApplicationController
  before_action :find_user

  def index
    @facade = search_keyword? ? MoviesFacade.new(params[:keyword]) : MoviesFacade.new
  end

  def show; end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def search_keyword?
    params[:keyword].present?
  end
end
