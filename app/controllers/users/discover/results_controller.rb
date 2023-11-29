require './poros/movie'

class Users::Discover::ResultsController < ApplicationController
  def index
    # should use service to implement these (research implementation)
    if params[:top_rated].present?
      conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
        faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
      end
      response = conn.get('movie/top_rated')
      parsed = JSON.parse(response.body, symbolize_names: true)
      @top_rated = parsed[:results].map do |movie|
        Movie.new(movie)
      end
    elsif params[:search].present?
      conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
        faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
        faraday.params[:query] = keyword
      end
      response = conn.get('search/movie')
      parsed = JSON.parse(response.body, symbolize_names: true)
      @search_result = parsed[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end
end
