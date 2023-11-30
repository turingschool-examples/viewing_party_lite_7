require './services/movies_search'
class Users::Discover::Results::PartiesController < ApplicationController
  def new
    @all_users = User.all
    @user = User.find(params[:user_id])
    movies_search = MoviesSearch.new
    @movie = movies_search.genre_runtime(params[:movie_id])
  end

  # refactor, this is too fat
  def create
    party = Party.new(party_params)
    @user = User.find(params[:user_id])
    movies_search = MoviesSearch.new
    @movie = movies_search.genre_runtime(params[:movie_id])
    
    if movie.runtime > party.duration
      flash[:alert] = 'invalid duration'
      redirect_to new_user_movie_party_path(@user, @movie)
    else
      party.save
      user_party = UserParty.create!(user: @user, party: party, host: true)
    end

    User.all.each do |user|
      if user != @user
        UserParty.create!(user: user, party: party, host: false)
      end
    end

    redirect_to user_path(user)
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id)
  end
end
