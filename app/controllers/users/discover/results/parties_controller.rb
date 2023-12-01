require './services/movies_search_service'
class Users::Discover::Results::PartiesController < ApplicationController
  def new
    @all_users = User.all
    @host = User.find(params[:user_id])
    movies_search = MoviesSearchService.new
    @movie = movies_search.genre_runtime(params[:id])
  end

  # refactor, this is too fat
  def create
    party = Party.new({
      duration: params[:duration],
      date: params[:date],
      start_time: params[:start_time],
      movie_id: params[:movie_id]
    })
    host = User.find(params[:user_id])
    movies_search = MoviesSearchService.new
    movie = movies_search.genre_runtime(params[:id])
    
    if movie.runtime > party.duration
      redirect_to "/users/#{host.id}/movies/#{movie.movie_id}/parties/new"
      flash[:alert] = 'invalid duration'
    else
      party.save
      user_party = UserParty.create!(user: host, party: party, host: true)
      User.all.each do |user|
        if user != host && params[:user.name] == 1
          UserParty.create!(user: user, party: party, host: false)
        end
      end
      redirect_to user_path(host)
    end
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id)
  end
end
