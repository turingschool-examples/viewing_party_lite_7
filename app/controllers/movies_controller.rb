# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
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
    # require 'pry';binding.pry
    response = conn.get("/3/movie/#{params[:id]}")
    @movie = JSON.parse(response.body, symbolize_names: true)
  end


  private

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end






end