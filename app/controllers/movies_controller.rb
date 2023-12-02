class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    
    @movies = if params[:q] == 'top-rated'
                MovieFacade.top_rated
              else
                MovieFacade.search(params[:search])
              end
  end

  def show
    @user = User.find(params[:id])

    # conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
    #   faraday.params['api_key'] = Rails.application.credentials.TMDB[:key]
    # end

    # #movie details
    # response_1 = conn.get("/3/movie/#{movie_id}")
    # #casting
    # response_2 = conn.get("/3/movie/#{movie_id}/credits")
    # #reviews
    # response_3 = conn.get("/3/movie/#{movie_id}/reviews")

    @movie_info = MovieFacade.movie_details(params[:movie_id])
    @cast = MovieFacade.cast(params[:movie_id])
    @reviews = MovieFacade.reviews(params[:movie_id])
  end
end
