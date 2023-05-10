class MoviesController < ApplicationController
  def index
    if params[:q].present?
      @movies
    else
      @movies
    end
  end
end