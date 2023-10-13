# frozen_string_literal: true

class ViewingPartyController < ApplicationController
  def new
    movie_id = params[:movie_id]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/movie/#{movie_id}")

    @movie = JSON.parse(response.body, symbolize_names: true)
    @users = User.all_excluding_id(params[:user_id])
  end

  def create
    party = Party.create(party_params)
    guest_list = [params[:user_id].to_i]
    params.select { |key, value| key.include?('invite') && value == '1' }
          .each_key { |key| guest_list << key.gsub('invite-', '').to_i }

    guest_list.each do |guest_id|
      PartyUser.create(user_id: guest_id, party_id: party.id, is_host: guest_id == params[:user_id].to_i)
    end

    redirect_to user_path(params[:user_id])
  end

  private

  def party_params
    params.permit(:movie_id, :date, :start_time, :duration)
  end
end
