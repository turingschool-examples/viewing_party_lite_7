class MoviesController < ApplicationController
  before_action :find_user
  before_action :find_keyword

  def index
    @facade = search_keyword? ? MovieFacade.new(params[:keyword]) : MovieFacade.new
  end

  def show
    @movie_facade = MovieFacade.new(params[:id])
    @credit_facade = CreditFacade.new(params[:id])
    @review_facade = ReviewFacade.new(params[:id])
    @movie = MovieFacade.get_movie(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def search_keyword?
    params[:keyword].present?
  end

  def find_keyword
    @keyword = params[:keyword]
  end
end
