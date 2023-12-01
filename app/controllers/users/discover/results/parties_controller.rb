require './services/movies_search'
class Users::Discover::Results::PartiesController < ApplicationController
  def new
    @all_users = User.all
    @host = User.find(params[:user_id])
    movies_search = MoviesSearch.new
    @movie = movies_search.genre_runtime(params[:id])
  end

  # refactor, this is too fat
  def create
    party = Party.new(party_params)
    host = User.find(params[:user_id])
    movies_search = MoviesSearch.new
    movie = movies_search.genre_runtime(params[:movie_id])
    
    if movie.runtime > party.duration
      flash[:alert] = 'invalid duration'
      redirect_to new_user_movie_party_path(host, movie)
    else
      party.save
    end
    
    user_party = UserParty.create!(user: host, party: party, host: true)
    User.all.each do |user|
      if user != host && params[:user.name] == 1
        UserParty.create!(user: user, party: party, host: false)
      end
    end

    redirect_to user_path(host)
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id)
  end
end
