class Users::Discover::ResultsController < ApplicationController
  def index
    movies_service = MoviesService.new
    if params[:top_rated].present?
      @top_rated = movies_service.top_movies
    elsif params[:title].present?
      @search_result = movies_service.search_movies(params[:title])
    end
  end
end
