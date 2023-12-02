class ViewingPartiesController < ApplicationController
  before_action :find_movie, only: [:new]
  before_action :find_user, only: [:new, :create]
  def new
    @users = User.all
    # require 'pry';binding.pry
  end

  def create
    viewing_party = ViewingParty.new(viewing_party_params)
    viewing_party.save
    UserViewingParty.create(user: @user, viewing_party:)

    User.all.each do |user|
      UserViewingParty.create(user:, viewing_party:)
    end

    redirect_to "/users/#{@user.id}"
  end

  private

  def find_movie
    @movie = facade.movie
  end

  def find_user
    @user = User.find(params[:id])
  end

  def viewing_party_params
    params.permit(:movie_id, :duration, :when, :start_time)
  end

  def facade
    MovieFacade.new(params[:movies_id])
  end
end
