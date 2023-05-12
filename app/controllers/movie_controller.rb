class MovieController < ApplicationController
  before_action :find_user, only: [:index, :results, :show]

  def index
  end

  def results
    @movies = MovieFacade.new.get_results(params[:q])
  end

  def show
    @movie = MovieFacade.new.get_movie(params[:movie_id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end