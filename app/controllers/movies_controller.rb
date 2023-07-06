class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params['api_key'] = ENV['MOVIE_DB_KEY']
    end

    response = conn.get('movie/top_rated')

    
    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results]
  end
end
