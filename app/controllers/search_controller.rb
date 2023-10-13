class SearchController < ApplicationController
  def search
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['MOVIE_API_KEY']
    end
    response = conn.get("/3/search/movie.json")

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results].map do |movie_data|
      Movie.new(movie_data)
    end

  end
end
