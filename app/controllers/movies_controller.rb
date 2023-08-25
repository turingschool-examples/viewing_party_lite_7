# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_user, only: %i[index show]

  def index
    @movies = if params[:title].present?
                MovieFacade.search_movies_by_title(params[:title])
              else
                MovieFacade.top_movies
              end
  end

  def show
    @movie = MovieFacade.get_movie(params[:movie_id])
    @cast = MovieFacade.get_cast(params[:movie_id])
    @reviews = MovieFacade.get_reviews(params[:movie_id])
    @review_count = MovieFacade.count_reviews(params[:movie_id])
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
