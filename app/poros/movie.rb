class Movie
  attr_reader :movie, :image_url, :title
  def initialize(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    @movie = JSON.parse(response.body, symbolize_names: true)
    @image_url = "https://image.tmdb.org/t/p/w92" << @movie[:poster_path]
    @title = @movie[:title]
  end

  private
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end
end




