class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    # conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
    #   faraday.params['api_key'] = ENV['MOVIE_DB_KEY']
    # end
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers['Authorization'] = ENV['TMDB_AUTH']
    end

    if params[:movie_search] 
      conn.params['query'] = params[:movie_search]
      response = conn.get("movie/search")
    else
      response = conn.get('movie/top_rated')
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end
end
