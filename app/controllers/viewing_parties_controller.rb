# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  before_action :find_movie
  before_action :find_user, only: %i[new create]

  def new
    @users = User.where('id !=  ?', params[:id])
  end

  def create
    viewing_party = ViewingParty.new(party_params)

    if viewing_party.duration < @movie.runtime
      flash[:error] = 'Viewing party duration can not be less than the run time of the movie. Please try again.'
      redirect_to "/users/#{params[:id]}/movies/#{@movie.id}/viewing_party/new"
    else
      viewing_party.save
      UserViewingParty.create(user: @user, viewing_party:, host: true)

      User.all.each do |user|
        UserViewingParty.create(user:, viewing_party:, host: false) if params[user.name.to_s] == '1'
      end

      redirect_to "/users/#{params[:id]}"
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_movie
    @movie = facade.movie
  end

  def party_params
    params.permit(:movie_id, :duration, :day, :view_time)
  end

  def facade
    MovieFacade.new(params[:movie_id])
  end
end
