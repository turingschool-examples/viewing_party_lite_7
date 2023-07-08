class MoviesController < ApplicationController
  before_action :find_user

  def index
    @facade = MovieFacade.new(params[:movie_search])

    if @facade.search != nil
      @movies = @facade.search_movies
    else
      @movies = @facade.top_movies
    end
  end

  def show
    # require 'pry'; binding.pry
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
