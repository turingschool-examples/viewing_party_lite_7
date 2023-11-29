# frozen_string_literal: true

class MoviesController < ApplicationController
  def index 
  end

  def search
    @movies = if params[:q] == "top_rated"
                MovieFacade.top_rated
              else
                MovieFacade.searched_movies(params[:q])
              end
  end
end