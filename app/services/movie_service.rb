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

  def self.searched_movies(search_term)
    get_url("/3/search/movie?query=#{search_term}")
  end

  def self.movie_details(id)
    get_url("/3/movie/#{id}")
  end

  def self.movie_cast(id)
    get_url("/3/movie/#{id}/credits")
  end

  def self.movie_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end
end