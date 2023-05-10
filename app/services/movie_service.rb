# frozen_string_literal: true

class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = '00a0de78b93bcdb648a48814b6465f22'
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_movies
    get_url('/3/movie/top_rated')
  end

  def self.movies_search(query)
    get_url("/3/search/movie?language=en-US&query=#{query}&page=1")
  end
end
