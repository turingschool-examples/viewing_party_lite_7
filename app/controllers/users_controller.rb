class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
    @movies = []
    @user.parties.uniq.each do |party|
      conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{party.movie_id}")
        response = conn.get("?api_key=#{Rails.application.credentials.tmdb[:key]}")
      @movies << JSON.parse(response.body, symbolize_names: true)
      @movies
    end
  end

  def new
    @user = User.create(item_params)
  end
  
  def create
    @user = User.create(item_params)
    redirect_to user_path(@user.id)
  end

  private
  def item_params
    params.permit(:name, :email)
  end 
end