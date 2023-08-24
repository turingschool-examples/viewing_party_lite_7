# frozen_string_literal: true

class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.params['api_key'] = ENV['MOVIE_API_KEY']
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_movies
    get_url('movie/top_rated')
  end

  def self.search_by_title(title)
    get_url("search/movie?query=#{title}")
  end

  def self.find_by_id(id)
    get_url("movie/#{id}")
  end
end
