class ViewingPartiesController < ApplicationController

  def new 
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIES_API_KEY"]
    end

    response = conn.get("/3/discover/movie")
    data = JSON.parse(response.body, symbolize_names: true)
    @movies = data[:results]
    
    end
  end
end