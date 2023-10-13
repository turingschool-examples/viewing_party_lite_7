# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    search_query = params[:search]

    movies = if search_query.present?
               MovieService.new.search_movies(search_query)
             else
               MovieService.new.top_rated_movies
             end

    @movies = movies[:results]
  end

  def show
    @user = User.find(params[:user_id])
    movie_id = params[:id]
    movie = MovieService.new.movie_details(movie_id)
    cast = MovieService.new.cast(movie_id)
    reviews = MovieService.new.movie_reviews(movie_id)

    @movie = Movie.new(movie)
    @cast = cast[:cast].first(10)
    @reviews = reviews[:results]
  end
end
