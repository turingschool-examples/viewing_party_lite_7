class Users::Discover::ResultsController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    # should use service to implement these (research implementation)
    if params[:top_rated].present?
      response = conn.get('movie/top_rated')
      parsed = JSON.parse(response.body, symbolize_names: true)
      @top_rated = parsed.map do |movie|
        Movie.new(movie)
      end
    elsif params[:search].present?
      response = conn.get('search/movie')
      parsed = JSON.parse(response.body, symbolize_names: true)
      @search_result = parsed.map do |movie|
        Movie.new(movie)
      end
    end
  end
end
