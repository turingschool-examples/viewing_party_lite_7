# frozen_string_literal: false

# app/controllers/viewing_parties_controller.rb
class ViewingPartiesController < ApplicationController
  def new
    @movie = MoviesFacade.new(params[:movie_id]).movie
    @users = User.where.not(id: params[:user_id])
  end

  def create
    @movie = MoviesFacade.new(params[:movie_id]).movie
    party = ViewingParty.create(date_time: param_datetime_formatter,
                                movie_id: params[:movie_id],
                                duration: params[:duration])
    if params[:duration].to_i < @movie.runtime
      redirect_to "/users/#{:user_id}/movies/#{:movie_id}/viewing_parties/new"
      flash[:alert] = 'Error: Duration must not be less than movie runtime'
    elsif party.save
      create_host_viewing_party(party)
      create_invited_viewing_party(party)
      redirect_to "/users/#{params[:user_id]}"
    else
      redirect_to "/users/#{:user_id}/movies/#{:movie_id}/viewing_parties/new"
      flash[:alert] = "Error: #{error_message(party.errors)}"
    end
  end

  private

  # def viewing_params
  #   date_time: param_datetime_formatter,
  #   movie_id: params[:movie_id],
  #   duration: params[:duration]
  # end
  
  def param_datetime_formatter # "2023-04-27 14:54:09 UTC"
    ""  <<  params["date(1i)"] << "-" <<
            params["date(2i)"] << "-" <<
            params["date(3i)"] << " " <<
            params["time(4i)"] << ":" <<
            params["time(5i)"] << ":" <<
            "00" << " " <<
            "UTC"
  end
  
  def create_host_viewing_party(party)
    UserViewingParty.create!(viewing_party: party, user_id: params[:user_id], host: true)
  end

  def create_invited_viewing_party(party)
    unless params[:invites_id].nil?
      params[:invites_id].each do |invite_id|
        UserViewingParty.create!(viewing_party: party, user_id: invite_id)
      end 
    end
  end
end