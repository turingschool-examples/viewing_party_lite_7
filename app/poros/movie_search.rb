class MovieSearch
  attr_reader :movie
  def initialize(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    @movie = JSON.parse(response.body, symbolize_names: true)
  end

  def title
    @movie[:title]
  end

  def image_url
    "https://image.tmdb.org/t/p/w92" << @movie[:poster_path]
  end

  private
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end
end




