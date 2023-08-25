# frozen_string_literal: true

class MovieService
  attr_reader :url, :movie_id

  def initialize(url, movie_id = nil)
    @url = url
    @movie_id = movie_id
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['MOVIES_API_KEY']
    end
  end

  def retrieve_movie_details
    response = conn.get(@url)
    data = JSON.parse(response.body, symbolize_names: true)
    movies = data[:results]
    found_movies = movies.find_all { |m| m[:id] == movie_id.to_i }
    found_movies.first
  end
end
