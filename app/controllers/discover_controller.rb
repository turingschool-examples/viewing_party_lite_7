class DiscoverController < ApplicationController
  def discover
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Api-Key"] = ENV["MOVIE_API_KEY"]
    end
    response = conn.get("/3/discover/movie.json")
    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
    movies = data[:results][0][:title]

    found_movies = movies.find_all { |m| m[:title] == params[:discover]}
    @movie = found_movies.first
    render "users/#{user_id}/discover"
  end
end