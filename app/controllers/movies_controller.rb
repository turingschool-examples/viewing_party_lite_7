# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_user, only: :index

  def index
    if params[:title].present?
      @movies = MovieFacade.search_movies_by_title(params[:title])
    else
      @movies = MovieFacade.top_movies
    end
  end

  def show
    
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
