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
      @movies = data[:results][0..19]
      @header = "Top 20 Movies"
    end
  end

  def show
    @facade = MoviesFacade.new(params[:id])
  end
end
