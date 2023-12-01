class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:q] == 'top-rated'

      conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.headers['authorization'] = Rails.application.credentials.TMDB[:authorization]
      end

      response = conn.get('/3/movie/top_rated')

      json = JSON.parse(response.body, symbolize_names: true)

      @movies = json[:results].map do |movie_data|
        Movie.new(movie_data)
      end
    end

    return unless params[:search].present?

    search_term = params[:search]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['authorization'] = Rails.application.credentials.TMDB[:authorization]
    end

    response = conn.get("/3/search/movie?query=#{search_term}")

    json = JSON.parse(response.body, symbolize_names: true)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def show
    @user = User.find(params[:id])
    movie_id = params[:movie_id]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['authorization'] = Rails.application.credentials.TMDB[:authorization]
    end

    response_1 = conn.get("/3/movie/#{movie_id}")
    response_2 = conn.get("/3/movie/#{movie_id}/credits")
    response_3 = conn.get("/3/movie/#{movie_id}/reviews")

    json_1 = JSON.parse(response_1.body, symbolize_names: true)
    json_2 = JSON.parse(response_2.body, symbolize_names: true)
    json_3 = JSON.parse(response_3.body, symbolize_names: true)

    combined_json = json_1.merge(json_2.merge(json_3))
    @movie = Movie.new(combined_json)
  end
end
