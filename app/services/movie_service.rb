class MovieService

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.TMDB[:key]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated
    get_url('/3/movie/top_rated')
  end

  def self.search(search_term)
    get_url("/3/search/movie?query=#{search_term}")
  end
end
