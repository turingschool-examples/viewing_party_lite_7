# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    @host = User.find(params[:user_id])
    @movie = Movie.movie
    @users = User.where.not(id: params[:user_id])
  end

  def create
    movie = Movie.movie
    duration = params[:duration]
    start_time = params[:start_time]
    date = params[:when]
  
    if duration.blank? || start_time.blank? || date.blank?
      flash[:alert] = "Duration, Start Time, and Date are required fields"
      redirect_to new_user_movie_viewing_party_path
      return
    end
  
    party = ViewingParty.create!(
      movie_id: movie.id,
      movie_title: movie.title,
      movie_image: movie.img,
      duration: duration,
      date: date,
      start_time: start_time
    )
  
    host = User.find(params[:user_id])
    
    if params[:guests].nil?
      flash[:alert] = "Add guests to the party"
      redirect_to new_user_movie_viewing_party_path
      return
    end

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
