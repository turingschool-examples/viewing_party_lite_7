class MoviesController < ApplicationController
  def index
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.headers["Authorization"] = "bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjY5ZThmM2QwNWJkYzkxOTI2YzI4YmJkZDAzZTdlZiIsInN1YiI6IjY1MjQzNGE5ZmQ2MzAwMDExYzc3ZTg0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ez5IGpT7FNcGDIq2tJITL6EROHwMkzhdyeWfvUfkd1Y"
    # end
    if params[:q] == "keyword"
      response = conn.get("/3/search/movie") do |req|
        req.params["with_keywords"] = params[:search]
      end
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results]
      @header = "Movie results for: #{params[:search]}" #fix me later
    else
      response = conn.get("/3/discover/movie?sort_by=popularity.desc")
      data = JSON.parse(response.body, symbolize_names: true)
      @movies = data[:results][1..20]
      @header = "Top 20 Movies"
    end
  end

  def show
    response = conn.get("/movie/#{params[:id]}")
    @movie = JSON.parse(response.body, symbolize_names: true)
  end


  private

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end






end