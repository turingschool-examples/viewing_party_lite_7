require './services/movies_search_service'
class Users::Discover::Results::PartiesController < ApplicationController
  def new
    @all_users = User.all
    @host = User.find(params[:user_id])
    movies_search = MoviesSearchService.new
    @movie = movies_search.genre_runtime(params[:id])
  end

  def create
    host = User.find(params[:user_id])
    movies_search = MoviesSearchService.new
    movie = movies_search.genre_runtime(params[:id])
    success, party = Party.create_with_checks(params, movie)
    if success
      user_party = UserParty.create!(user: host, party: party, host: true)
      User.all.each do |user|
        if user != host && params[user.name.to_s] == '1'
          UserParty.create!(user: user, party: party, host: false)
        end
      end
      redirect_to user_path(host)
    else
      redirect_to "/users/#{host.id}/movies/#{movie.movie_id}/parties/new"
      flash[:alert] = 'invalid duration'
    end
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id)
  end
end
