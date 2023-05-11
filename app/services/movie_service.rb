# frozen_string_literal: true

class MovieService
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['api_key']
    end
  end

  def self.top_movies
    get_url('/3/movie/top_rated')
  end

  def self.movies_search(input)
    get_url("/3/search/movie?language=en-US&query=#{input}&page=1&include_adult=false")
  end

  def self.movie_search(id)
    get_url("/3/movie/#{id}")
  end

  def self.movie_search(id)
    get_url("/3/movie/#{id}")
  end
end
