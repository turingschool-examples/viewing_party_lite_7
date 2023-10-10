module Api
  module V1
    class MoviesController < ApplicationController
      def show
        service = MovieService.new
        @movie_details = service.movie_details(params[:id])
        @movie_cast = service.movie_cast(params[:id])
        @movie_reviews = service.movie_reviews(params[:id])
      end
    end
  end
end