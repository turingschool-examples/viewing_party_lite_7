# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    if params[:q] == "keyword"
      response = conn.get("/3/search/movie") do |req|
        req.params["query"] = params[:search]
      end
      data = json_parse(response)
      @movies = data[:results]
      @header = "Movie results for: #{params[:search]}" #fix me later
    else
      response = conn.get("/3/discover/movie?sort_by=popularity.desc")
      data = json_parse(response)
      @movies = data[:results][1..20]
      @header = "Top 20 Movies"
    end
  end

  def show
    details = conn.get("/3/movie/#{params[:id]}")
    credits = conn.get("/3/movie/#{params[:id]}/credits")
    reviews = conn.get("/3/movie/#{params[:id]}/reviews")
    @movie = json_parse(details)
    @cast = json_parse(credits)[:cast][0..9]
    @reviews = json_parse(reviews)
  end
end
