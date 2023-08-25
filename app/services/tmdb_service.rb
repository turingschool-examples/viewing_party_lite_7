class TmdbService
  def initialize
    @connection = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['TMDb_API_KEY']
    end
  end

  def top_rated_movies
    response = @connection.get('/3/movie/top_rated?language=en-US&page=1')
    return [] unless response.success?

    movie_data = JSON.parse(response.body)['results']
    MovieMapper.top_results(movie_data)
  end

  def search_movies(query)
    response = @connection.get('/3/search/movie', { query: query, language: 'en-US', page: 1 })
    return [] unless response.success?

    movie_data = JSON.parse(response.body)['results']
    MovieMapper.top_results(movie_data)
  end

  def movie_details(id)
    response = @connection.get("/3/movie/#{id}")
    return [] unless response.success?

    movie_data = JSON.parse(response.body)
    MovieMapper.map_movie_details(movie_data)
  end

  def cast_details(id)
    response = @connection.get("/3/movie/#{id}/credits")
    return [] unless response.success?

    cast_data = JSON.parse(response.body)
    CastMapper.map_cast_details(cast_data)
  end

  def review_count(id)
    response = @connection.get("/3/movie/#{id}/reviews")
    return [] unless response.success?

    review_data = JSON.parse(response.body)
    ReviewMapper.map_review_details(review_data)
  end

  def get_movie_image(id)
    response = @connection.get("/3/movie/#{id}/images")
    return [] unless response.success?

    review_data = JSON.parse(response.body)
    return "https://image.tmdb.org/t/p/w500#{review_data['backdrops'].first['file_path']}"
  end
end
