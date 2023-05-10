# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = SearchFacade.new(params).movies
  end

  def show
    @movie = SearchFacade.new(params).movies
    @user = User.find(params[:user_id])
  end
end
