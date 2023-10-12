# app/controllers/viewing_parties_controller.rb

class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieSearch.new(params[:movie_id])
    @users = User.where.not(id: params[:user_id])
  end

  def create
    party = ViewingParty.create!(date_time: param_datetime_formatter,
                                  movie_id: params[:movie_id],
                                  duration: params[:duration])
    #makes host
    UserViewingParty.create!(viewing_party: party, user_id: params[:user_id], host: true)
    #makes invited
    params[:invites_id].each do |invite_id|
      UserViewingParty.create!(viewing_party: party, user_id: invite_id)
    end
    redirect_to "/users/#{params[:user_id]}"
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
end