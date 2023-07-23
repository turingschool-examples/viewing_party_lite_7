class MovieService
  def self.connect
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['TMDB-KEY']
  end
  end
end
