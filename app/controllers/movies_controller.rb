class MoviesController < ApplicationController
  def index 
  end

  def search
    @movies = if params[:q] == "top_rated"
                MovieFacade.top_rated
              else
                if params[:q].blank?
                  flash[:alert] = "Please enter a Movie title"
                  # render :index
                  redirect_back(fallback_location: "/users/#{params[:id]}/discover")
                else
                  MovieFacade.searched_movies(params[:q])
                end
              end
  end

  def show

  end
end