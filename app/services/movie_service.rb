class MovieService
  def self.conn 
      Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
      end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    get_url('/3/movie/top_rated')
  end
end