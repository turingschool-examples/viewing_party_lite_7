class Users::Discover::Results::PartiesController < ApplicationController
  def new
    movies_search = MoviesSearch.new
    @movie = movies_search.genre_runtime(params[:movie_id])
  end

  def create
    party = Party.new(party_params)
    user = User.find(params[:user_id])
    movies_search = MoviesSearch.new
    movie = movies_search.genre_runtime(params[:movie_id])

    if party.save
      redirect_to user_path(user)
    elsif # blank field, duration compare to movie
      flash[:alert] = ''
      redirect_to new_user_movie_party_path(user, movie)
    end
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id)
  end
end
