class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.where("id != #{params[:user_id]}")
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{params[:movid_id]}")
      response = conn.get("?api_key=#{Rails.application.credentials.tmdb[:key]}")
    @movie = JSON.parse(response.body, symbolize_names: true)
    @party = @user.user_parties.new
  end

  def create

  end
end