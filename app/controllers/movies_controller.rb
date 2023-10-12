class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:search] != nil
      movies = MovieFacade.new("3/search/movie?query=#{params[:search]}&include_adult=false&language=en-US&page=1")

      @movies = movies.movies
    else
      movies = MovieFacade.new("3/movie/top_rated?language=en-US&page=1")

      @movies = movies.movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    movie = MovieFacade.new("3/movie/#{params[:id]}?language=en-US")
    cast = MovieFacade.new("3/movie/#{params[:id]}/credits?language=en-US")
    reviews = MovieFacade.new("3/movie/#{params[:id]}/reviews?language=en-US")

    @movie = movie.movie
    @cast = cast.cast
    @reviews = reviews.reviews
  end
end