class ViewingPartyController < ApplicationController
  def new
    # need to pass the JSON from TMDB so that I have the movie duration
    movie_id = params[:movie_id]

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/movie/#{movie_id}")

    @movie = JSON.parse(response.body, symbolize_names: true)
  end
end