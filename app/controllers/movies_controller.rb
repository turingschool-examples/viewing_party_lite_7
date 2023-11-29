class MoviesController < ApplicationController
  def index 
    
  end

  def search
    @movies = if params[:q] == "top_rated"
                facade.top_rated
              else
                facade.searched_movies(params[:q])
              end
  end
end