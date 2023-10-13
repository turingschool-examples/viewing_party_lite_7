class MoviesController < ApplicationController
  def index
    if params[:Movie_Title].present?
      conn = Faraday.new(url: "https://api.themoviedb.org/3/search/movie")
      response = conn.get("?api_key=#{Rails.application.credentials.tmdb[:key]}&query=#{params[:Movie_Title]}")
      data = JSON.parse(response.body, symbolize_names: true)
      @results = data[:results]
      # require 'pry';binding.pry
    else
      conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/popular")
      response = conn.get("?api_key=#{Rails.application.credentials.tmdb[:key]}")
      data = JSON.parse(response.body, symbolize_names: true)
      @results = data[:results]
    end
  end

  def show
    # Fetch movie details
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{params[:id]}")
    response = conn.get("?api_key=#{Rails.application.credentials.tmdb[:key]}")
    @data = JSON.parse(response.body, symbolize_names: true)

    # Fetch cast information
    conn2 = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{params[:id]}/credits")
    response2 = conn2.get("?api_key=#{Rails.application.credentials.tmdb[:key]}")
    @data2 = JSON.parse(response2.body, symbolize_names: true)
    
    # Fetch movie reviews
    conn3 = Faraday.new(url: "https://api.themoviedb.org/3/movie/#{params[:id]}/reviews")
    response3 = conn3.get("?api_key=#{Rails.application.credentials.tmdb[:key]}")
    @data3 = JSON.parse(response3.body, symbolize_names: true)
    
    end
end 