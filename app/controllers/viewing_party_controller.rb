# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @host = User.find(params[:user_id])
    @movie = Movie.movie
    @users = User.where.not(id: params[:user_id])
  end

  def create
    movie = Movie.movie
    party = ViewingParty.create!(
      movie_id: movie.id,
      movie_title: movie.title,
      movie_image: movie.img,
      duration: params[:duration],
      date: params[:when],
      start_time: params[:start_time]
    )

    host = User.find(params[:user_id])
    users = params[:guests].map do |guest|
      User.find(guest)
    end
    UsersViewingParty.create!(user_id: host.id, viewing_party_id: party.id, hosting?: true)
    users.each do |user|
      UsersViewingParty.create!(user_id: user.id, viewing_party_id: party.id)
    end
    redirect_to user_path(host)
  end
end
