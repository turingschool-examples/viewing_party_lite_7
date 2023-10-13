# frozen_string_literal: true

# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = if params[:q] == 'keyword'
                MoviesFacade.new.movie_search(params[:search])
              else
                MoviesFacade.new.movie_discover
              end
  end

  def show
    @facade = MoviesFacade.new(params[:id])
  end
end
