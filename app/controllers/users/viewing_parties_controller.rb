class Users::ViewingPartiesController < ApplicationController

  def new
    # binding.pry
    facade = MoviedbFacade.new(movie_id: params[:movie_id]).find_movie_info
    @movie = Movie.new(movie: facade)
    @party = Party.new
    binding.pry
  end
end