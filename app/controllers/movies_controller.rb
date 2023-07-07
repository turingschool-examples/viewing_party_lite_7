class MoviesController < ApplicationController
  before_action :find_user

  def index
    @facade = search_keyword? ? MovieFacade.new(params[:keyword]) : MovieFacade.new
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
