class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    facade = MovieFacade.new(params[:movie_id])
    @movie = facade.get_movie
    @potential_guests = User.potential_guests(params[:user_id])
  end

  def create
    new_party = ViewingParty.create({ movie_id: params[:movie_id],
                                      duration: params[:duration],
                                      date: params[:when],
                                      start_time: params[:start_time],
                                      user_id: params[:user_id] })
    if new_party.valid?
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing_parties/#{params}}"
    else
      redirect_back(fallback_location: '/')
    end
  end
end
