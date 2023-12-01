class MoviesController < ApplicationController
  def index 
  end

  def search
    @movies = if params[:q] == "top_rated"
                MovieFacade.top_rated
              else
                if params[:q].blank?
                  flash[:alert] = "Please enter a Movie title"
                  redirect_back(fallback_location: "/users/#{params[:id]}/discover")
                else
                  MovieFacade.searched_movies(params[:q])
                end
              end
  end

  def show
    @data = MovieFacade.movie_details(params[:movie_id])
    @data2 = MovieFacade.movie_cast(params[:movie_id])
    @data3 = MovieFacade.movie_reviews(params[:movie_id])
  end
end