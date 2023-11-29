# frozen_string_literal: true

class MoviesController < ApplicationController
  def index 
  end

  def search
    # require 'pry'; binding.pry
    @movies = if params[:q] == "top_rated"
                MovieFacade.top_rated
              else
                # facade.searched_movies(params[:q])
              end
  end
end