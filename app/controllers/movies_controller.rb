# controller for data from movies API
class MoviesController < ApplicationController
  before_action :find_user, only: [:discover, :index]

  def discover; end

  def index
    if params[:search].present?
      @movies = MovieFacade.new.find_movies(params[:search])
    # else
    #   @movies =
    end
  end

  def show
    
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
