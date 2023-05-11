class MovieService
  def self.get_movie(id)
    JSON.parse(conn.get("movie/#{id}").body, symbolize_names: true)
  end

  def self.top_rated_movies
    JSON.parse(conn.get('movie/top_rated').body, symbolize_names: true)
  end

  private

  def self.conn
    #require 'pry'; binding.pry
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |f|
      f.params['api_key'] = ENV['TMDB_KEY']
    end
  end
end