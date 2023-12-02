# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:top_movies] == 'top rated'
      @facade = Top20Facade.new(params[:top_movies])
    elsif !params[:search].nil?
      # search
      @facade = MovieSearchFacade.new(params[:search])
    end
  end

  def show
    @facade = MovieDetailsFacade.new(params[:id])
    @user = User.find(params[:user_id])
  end

  private

  def top20
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get('/3/movie/top_rated')
    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end

  # def search
    # conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
    #   faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    # end
    # search_term = params[:search]

    # response = conn.get("/3/search/movie?query=#{search_term}")
    # json = JSON.parse(response.body, symbolize_names: true)
    # @movies = json[:results].take(20)
      # MovieSearch.new(search_term)
  # end
end
