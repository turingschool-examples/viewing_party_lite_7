class MoviesController < ApplicationController
  before_action :user
  def index
    # require 'pry'; binding.pry
    # user = User.find(params[:format])
    # require 'pry'; binding.pry
    if params[:q] == 'top rated'
      @facade = MovieFacade.new(user: user, type: :top_rated)
    else
      @facade = MovieFacade.new(user: user, type: :search, query: params[:q])
    end
  end

  def show
    # user = User.find(params[:user_dashboard_id])
    # require 'pry'; binding.pry
    @facade = MovieFacade.new(user: user, type: :details, movie_id: params[:id])
    @facade_movies = @facade.movies
  end

  private
    def user
      current_user
    end
end
