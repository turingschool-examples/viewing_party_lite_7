class TmdbService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['tmdb_key']
  end
end