class MovieController < ApplicationController
  before_action :find_user, only: [:index, :results, :show]

  def index
  end

  def results
    @movies = MoviesFacade.new.get_results(params[:q])
  end

  def show
    @facade = MovieFacade.new(params[:movie_id])
    @movie = MoviesFacade.new.get_movie(params[:movie_id])
    @cast = CastFacade.new.get_cast(params[:movie_id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end