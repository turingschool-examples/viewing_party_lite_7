# frozen_string_literal: true

class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
    @party = ViewingParty.new
  end

  def create

    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
    @party = ViewingParty.new(:movie_id => params[:movie_id], :user_id => params[:user_id], :date_time => params[:date_time], :duration => @movie.runtime, :start_time => params[:date_time])
   
    unless Movie.exists?(params[:movie_id])
      Movie.create!(id: params[:movie_id], title: @movie.title, runtime: @movie.runtime, genres: @movie.genres)
    end

    @party.save
    params[:invitees].each do |key, value|
      if value == "1"
        UserViewingParty.new(user_id: key, viewing_party_id: @party.id).save
      end
    end

    if @party.save
      flash[:success] = "Party Created!"
      redirect_to user_path(@user)
    else
      puts @party.errors.full_messages.to_sentence
      render :new
    end
  end
end
