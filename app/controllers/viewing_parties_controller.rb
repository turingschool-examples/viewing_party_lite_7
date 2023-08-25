class ViewingPartiesController < ApplicationController

  def new 
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
    end
    response = conn.get("/3/movie/#{params[:movie_id]}")
    data = JSON.parse(response.body, symbolize_names: true)
    @movie = data    

    @users = User.all
  end

  def create
    # @user = User.find(params[:user_id])

    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
    # end
    # response = conn.get("/3/movie/#{params[:movie_id]}")
    # data = JSON.parse(response.body, symbolize_names: true)
    # @movie = data    

    @viewing_party = ViewingParty.new(viewing_party_params)
    if @viewing_party.save
      redirect_to user_path((params[:user_id]))
    else
      redirect_to new_user_movie_viewing_party_path(@user, params[:movie_id])
      flash[:notice] = "Error: Please fill out all fields correctly."
    end

  end
end