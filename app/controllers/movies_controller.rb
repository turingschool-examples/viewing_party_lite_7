# controller for data from movies API
class MoviesController < ApplicationController
  before_action :find_user, only: [:discover, :index]

  def discover; end

  def index
    @movies = if params[:search].present?
                MovieFacade.new.find_movies(params[:search])
              elsif params[:q] == "top20rated"
                MovieFacade.new.top_rated_movies
              else
              end
  end

  def show; end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
