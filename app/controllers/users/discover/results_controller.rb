class Users::Discover::ResultsController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
    if params[:top_rated].present?
      response = conn.get('3/movie/top_rated')
      @top_rated = JSON.parse(response.body, symbolize_names: true)
    elsif params[:search].present?
      response = conn.get('')
      @search_result = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
