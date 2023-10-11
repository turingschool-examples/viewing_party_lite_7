class MoviesController < ApplicationController
  def index
    if params[:Movie_Title].present?

    else
      conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/popular")
      response = conn.get("?api_key=#{Rails.application.credentials.tmdb[:key]}")
      data = JSON.parse(response.body, symbolize_names: true)
      @results = data[:results]
    end
  end
end 