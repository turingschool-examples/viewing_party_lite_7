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
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
    end
    response = conn.get("/3/movie/#{params[:movie_id]}.json")
    data = JSON.parse(response.body, symbolize_names: true)
    @movie = data
    
    @viewing_party = @user.viewing_parties.create!(viewing_party_params)
    @viewing_party.movie_title = @movie[:title]
    if @viewing_party.save
      redirect_to user_path((params[:user_id]))
    else
      redirect_to new_user_movie_viewing_party_path(@user, @movie.id)
      flash[:notice] = "Error: Please fill out all fields correctly."
    end
  end

  private
  def viewing_party_params
    params.permit(:duration, :date, :start_time)
  end
end