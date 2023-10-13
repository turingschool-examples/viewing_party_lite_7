class SearchController < ApplicationController
  def search
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['MOVIE_API_KEY']
    end
    response = conn.get("/3/movie/top_rated")

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results]

    found_movies = movies.map do |movie_data|
      # movie_data[:original_title] == params[:search]
    end
    @movie = found_movies.first
  end
end
