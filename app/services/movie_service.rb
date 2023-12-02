class MovieService
  # def discover
  #   json_from_url('/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc')
  # end

  def self.json_from_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.headers['authorization'] =
        Rails.application.credentials.tmdb[:access_token]
    end
  end

  def self.top_rated_movies
    json_from_url('/3/movie/top_rated')
  end

  def self.search_by_title(title)
    json_from_url("/3/search/movie?query=#{title}")
  end

  def self.movie_data(id)
    json_from_url("/3/movie/#{id}")
  end

  def self.cast(id)
    json_from_url("/3/movie/#{id}/credits")
  end

  def self.reviews(id)
    json_from_url("/3/movie/#{id}/reviews")
  end
end
