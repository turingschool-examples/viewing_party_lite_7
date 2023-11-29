class Users::Discover::ResultsController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers[:Authorization] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
    end
    if params[:top_rated].present?
      response = conn.get('movie/top_rated')
      @top_rated = JSON.parse(response.body, symbolize_names: true)
    elsif params[:search].present?
      response = conn.get('search/movie')
      @search_result = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
