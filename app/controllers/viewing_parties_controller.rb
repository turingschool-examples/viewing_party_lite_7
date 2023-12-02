class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    facade = MovieFacade.new(params[:movie_id])
    @movie = facade.get_movie
    @potential_guests = User.potential_guests(params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    facade = MovieFacade.new(params[:movie_id])
    movie = facade.get_movie
    new_party = ViewingParty.create({movie_id: movie.id, 
                        duration: params[:duration],
                        date: params[:when],
                        start_time: params[:start_time]
                      })
    if new_party.valid?
      redirect_to party_guest_create_path
    else
      redirect_back(fallback_location: '/')
    end
  end
end
