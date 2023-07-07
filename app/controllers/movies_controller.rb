class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
    movie = params[:search]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params["api_key"] = ENV["MOVIE_DB_API_KEY"]
    end

    if params[:search].present?
      response = conn.get("/3/search/movie?query=#{movie}")
    else
      response = conn.get('/3/movie/top_rated')
    end


    json = JSON.parse(response.body, symbolize_names: true)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end