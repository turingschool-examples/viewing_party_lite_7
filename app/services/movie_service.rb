class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.params['api_key'] = ENV['MOVIE_API_KEY']
    end
  end
end